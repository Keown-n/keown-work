// Inject floating UI on icon click
chrome.action.onClicked.addListener(async (tab) => {
  try {
    if (!tab?.id) return;

    await chrome.scripting.executeScript({
      target: { tabId: tab.id },
      files: ["floating.js"]
    });
  } catch (err) {
    console.error("Failed to inject floating.js:", err);
  }
});

// Proxy API calls (avoids Mixed Content when page is HTTPS)
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message?.type !== "CALL_API") return;

  fetch("http://localhost:5000/receive", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(message.payload || {})
  })
    .then(async (res) => {
      const json = await res.json().catch(() => ({}));
      if (!res.ok) {
        const msg = json?.error || `Request failed (${res.status})`;
        throw new Error(msg);
      }
      sendResponse({ ok: true, data: json });
    })
    .catch((err) => {
      sendResponse({ ok: false, error: String(err?.message || err) });
    });

  return true; // keep channel open for async response
});
