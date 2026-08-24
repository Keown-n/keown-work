(() => {
  const APP_ID = "cv-app";
  const STYLE_ID = "cv-app-style";

  // Toggle off if already exists
  const existing = document.getElementById(APP_ID);
  if (existing) {
    existing.remove();
    const s = document.getElementById(STYLE_ID);
    if (s) s.remove();
    return;
  }

  // ---------- Styles ----------
  const style = document.createElement("style");
  style.id = STYLE_ID;
  style.textContent = `
    #${APP_ID} {
      position: fixed;
      top: 120px;
      right: 22px;
      z-index: 999999;
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      color: #111827;
      user-select: none;
    }

    #${APP_ID} .cv-card {
      background: #fff;
      border: 1px solid #e5e7eb;
      border-radius: 14px;
      box-shadow: 0 14px 40px rgba(0,0,0,0.14);
      overflow: hidden;
    }

    #${APP_ID} .cv-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px 10px 8px 12px;
      border-bottom: 1px solid #f1f5f9;
      cursor: grab;
    }
    #${APP_ID} .cv-header:active { cursor: grabbing; }

    #${APP_ID} .cv-title {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 14px;
      font-weight: 650;
      letter-spacing: 0.2px;
      color: #111827;
    }

    #${APP_ID} .cv-badge {
      font-size: 11px;
      font-weight: 700;
      padding: 3px 8px;
      border-radius: 999px;
      background: #f3f4f6;
      color: #374151;
      border: 1px solid #e5e7eb;
    }

    #${APP_ID} .cv-close {
      width: 30px;
      height: 30px;
      border: none;
      background: transparent;
      border-radius: 10px;
      cursor: pointer;
      color: #6b7280;
      display: grid;
      place-items: center;
      font-size: 18px;
      line-height: 1;
    }
    #${APP_ID} .cv-close:hover { background: #f3f4f6; color: #111827; }

    #${APP_ID} .cv-body { padding: 12px; }

    #${APP_ID} .cv-sub {
      font-size: 12px;
      color: #6b7280;
      margin-bottom: 10px;
      user-select: text;
    }

    #${APP_ID} .cv-actions {
      display: flex;
      gap: 10px;
      justify-content: center;
      margin-top: 6px;
    }

    #${APP_ID} .cv-btn {
      border: none;
      background: #111827;
      color: #fff;
      padding: 10px 14px;
      border-radius: 12px;
      font-size: 13px;
      font-weight: 650;
      cursor: pointer;
      min-width: 110px;
      box-shadow: 0 2px 0 rgba(0,0,0,0.08);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }
    #${APP_ID} .cv-btn:hover { filter: brightness(1.05); }
    #${APP_ID} .cv-btn:active { transform: translateY(1px); }
    #${APP_ID} .cv-btn:disabled {
      opacity: 0.65;
      cursor: not-allowed;
      transform: none;
      filter: none;
    }

    #${APP_ID} .cv-btn-secondary {
      border: 1px solid #e5e7eb;
      background: #ffffff;
      color: #111827;
      padding: 10px 14px;
      border-radius: 12px;
      font-size: 13px;
      font-weight: 650;
      cursor: pointer;
      min-width: 110px;
    }
    #${APP_ID} .cv-btn-secondary:hover { background: #f9fafb; }
    #${APP_ID} .cv-btn-secondary:disabled {
      opacity: 0.65;
      cursor: not-allowed;
    }

    #${APP_ID} .screen-small { width: 290px; }
    #${APP_ID} .screen-confidence { width: 460px; }

    #${APP_ID} .cv-metric {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 10px;
      margin: 2px 0 6px;
    }

    #${APP_ID} .cv-metric h1 {
      font-size: 18px;
      margin: 0;
      font-weight: 850;
      letter-spacing: -0.2px;
      color: #111827;
      user-select: text;
    }

    #${APP_ID} .cv-pill {
      font-size: 12px;
      font-weight: 800;
      padding: 6px 10px;
      border-radius: 999px;
      border: 1px solid #e5e7eb;
      background: #f9fafb;
      color: #111827;
      user-select: text;
      white-space: nowrap;
    }
    #${APP_ID} .cv-pill-strong {
      background: #111827;
      color: #fff;
      border-color: #111827;
    }

    #${APP_ID} .cv-divider {
      height: 1px;
      background: #eef2f7;
      margin: 10px 0 12px;
    }

    #${APP_ID} .cv-section-title {
      font-size: 13px;
      font-weight: 800;
      color: #111827;
      margin: 0 0 8px;
      user-select: text;
    }

    #${APP_ID} .cv-sources {
      display: flex;
      flex-direction: column;
      gap: 8px;
      margin: 0;
      padding: 0;
      list-style: none;
      user-select: text;
    }

    #${APP_ID} .cv-source {
      display: flex;
      gap: 10px;
      align-items: flex-start;
      padding: 10px 10px;
      border: 1px solid #e5e7eb;
      border-radius: 12px;
      background: #ffffff;
    }

    #${APP_ID} .cv-source .cv-dot {
      width: 10px;
      height: 10px;
      border-radius: 999px;
      background: #111827;
      opacity: 0.85;
      margin-top: 4px;
      flex: 0 0 auto;
    }

    #${APP_ID} .cv-source-text {
      display: flex;
      flex-direction: column;
      gap: 4px;
      min-width: 0;
      flex: 1;
    }

    #${APP_ID} .cv-source-title {
      font-size: 12px;
      font-weight: 750;
      color: #111827;
      line-height: 1.25;
      user-select: text;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
    }

    #${APP_ID} .cv-source-meta {
      display: flex;
      gap: 8px;
      align-items: center;
      flex-wrap: wrap;
      font-size: 11px;
      color: #6b7280;
    }

    #${APP_ID} .cv-chip {
      padding: 2px 8px;
      border-radius: 999px;
      border: 1px solid #e5e7eb;
      background: #f9fafb;
      color: #374151;
      font-weight: 700;
      max-width: 100%;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    #${APP_ID} .cv-link a {
      color: #6b7280;
      text-decoration: none;
      font-weight: 700;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      display: inline-block;
      max-width: 260px;
    }
    #${APP_ID} .cv-link a:hover { text-decoration: underline; }

    #${APP_ID} .cv-footer-hint {
      margin-top: 10px;
      font-size: 11px;
      color: #6b7280;
      user-select: text;
    }

    #${APP_ID} .cv-error {
      margin-top: 10px;
      font-size: 12px;
      color: #b91c1c;
      user-select: text;
      white-space: pre-wrap;
    }

    /* Spinner */
    #${APP_ID} .cv-spinner {
      width: 14px;
      height: 14px;
      border-radius: 999px;
      border: 2px solid rgba(255,255,255,0.35);
      border-top-color: rgba(255,255,255,0.95);
      animation: cvspin 0.8s linear infinite;
    }
    @keyframes cvspin { to { transform: rotate(360deg); } }

    @media (max-width: 520px) {
      #${APP_ID} { right: 10px; }
      #${APP_ID} .screen-confidence { width: calc(100vw - 24px); }
      #${APP_ID} .cv-link a { max-width: calc(100vw - 170px); }
    }
  `;
  document.documentElement.appendChild(style);

  // ---------- Root ----------
  const app = document.createElement("div");
  app.id = APP_ID;

  // State
  let screen = "small"; // "small" | "confidence"
  let loading = false;

  // Results state
  let avgSimilarityPercent = null;   // average across all evidence (if provided)
  let matchedSources = null;         // X
  let totalSources = null;           // Y
  let sources = [];
  let statusMessage = "";
  let errorMessage = "";

  // Drag state
  let dragging = false;
  let offsetX = 0;
  let offsetY = 0;

  const clamp = (v, min, max) => Math.max(min, Math.min(max, v));

  const removeApp = () => {
    app.remove();
    const s = document.getElementById(STYLE_ID);
    if (s) s.remove();
    document.removeEventListener("keydown", onKeyDown);
    document.removeEventListener("mousemove", onMouseMove);
    document.removeEventListener("mouseup", onMouseUp);
  };

  const onKeyDown = (e) => {
    if (e.key === "Escape") removeApp();
  };
  document.addEventListener("keydown", onKeyDown);

  // ---------- Drag ----------
  const onMouseDown = (e) => {
    if (e.target.closest("button") || e.target.closest("a")) return;

    dragging = true;
    const rect = app.getBoundingClientRect();
    offsetX = e.clientX - rect.left;
    offsetY = e.clientY - rect.top;

    app.style.left = rect.left + "px";
    app.style.top = rect.top + "px";
    app.style.right = "auto";
    app.style.transform = "none";

    e.preventDefault();
  };

  const onMouseMove = (e) => {
    if (!dragging) return;

    const w = app.offsetWidth;
    const h = app.offsetHeight;

    const x = clamp(e.clientX - offsetX, 8, window.innerWidth - w - 8);
    const y = clamp(e.clientY - offsetY, 8, window.innerHeight - h - 8);

    app.style.left = x + "px";
    app.style.top = y + "px";
  };

  const onMouseUp = () => { dragging = false; };

  document.addEventListener("mousemove", onMouseMove);
  document.addEventListener("mouseup", onMouseUp);

  const attachHeaderDrag = () => {
    const header = app.querySelector(".cv-header");
    if (header) header.addEventListener("mousedown", onMouseDown);
  };

  // ---------- Helpers ----------
  const getPagePreview = () => {
    const text = (document.body?.innerText || "").replace(/\s+/g, " ").trim();
    return text.slice(0, 320);
  };

  const safeHostname = (u) => {
    try { return new URL(u).hostname; } catch { return u || ""; }
  };

  const formatDate = (iso) => {
    if (!iso) return "—";
    try {
      const d = new Date(iso);
      if (Number.isNaN(d.getTime())) return "—";
      return d.toLocaleDateString(undefined, { year: "numeric", month: "short", day: "2-digit" });
    } catch {
      return "—";
    }
  };

  // IMPORTANT: call backend via background.js to avoid Mixed Content blocks
  const callServer = (payload) => {
    return new Promise((resolve, reject) => {
      chrome.runtime.sendMessage({ type: "CALL_API", payload }, (response) => {
        if (!response) return reject(new Error("No response from background service worker"));
        if (!response.ok) return reject(new Error(response.error || "API error"));
        resolve(response.data);
      });
    });
  };

  const runScan = async () => {
    loading = true;
    errorMessage = "";
    statusMessage = "Scanning…";
    avgSimilarityPercent = null;
    matchedSources = null;
    totalSources = null;
    sources = [];

    // Stay on UI 1 and show loading signal while scanning
    render();

    const payload = {
      title: document.title || "",
      url: location.href,
      text_length: (document.body?.innerText || "").length,
      preview: getPagePreview()
    };

    try {
      const resp = await callServer(payload);

      // Support both shapes:
      // 1) { result: { sources_supporting, total_sources, evidence, ... }, avg_similarity_percent, sources: [...] }
      // 2) { sources_supporting, total_sources, evidence, ... } (direct)
      const result = resp.result || resp || {};

      matchedSources =
        (resp.sources_supporting ?? result.sources_supporting ?? null);

      totalSources =
        (resp.total_sources ?? result.total_sources ?? null);

      avgSimilarityPercent =
        (resp.avg_similarity_percent ?? null);

      sources =
        resp.sources || result.evidence || [];

      if (result.match_found) {
        statusMessage = result.ingestion_ran
          ? `Match found (after ingest ${result.resolved_symbol || ""})`.trim()
          : "Match found";
      } else {
        statusMessage = result.message || "No match found";
      }

      screen = "confidence";
    } catch (err) {
      errorMessage = String(err?.message || err || "Unknown error");
      statusMessage = "";
      screen = "confidence";
    } finally {
      loading = false;
      render();
    }
  };

  // ---------- Render ----------
  // UI 1: KEEP EXACTLY THE SAME AS YOUR CURRENT UI 1
  const renderSmall = () => {
    app.innerHTML = `
      <div class="cv-card screen-small">
        <div class="cv-header">
          <div class="cv-title">
            Cross Validate <span class="cv-badge">BETA</span>
          </div>
          <button class="cv-close" id="cv-close" title="Close">×</button>
        </div>

        <div class="cv-body">
          <div class="cv-sub">
            ${loading ? "Scanning this page… please wait." : "Scan this page to generate results and sources."}
          </div>

          <div class="cv-actions">
            <button class="cv-btn" id="cv-scan" ${loading ? "disabled" : ""}>
              ${loading ? `<span class="cv-spinner" aria-hidden="true"></span> Scanning…` : "Scan"}
            </button>
          </div>

          <div class="cv-footer-hint">Tip: drag the header • Esc to close</div>
        </div>
      </div>
    `;

    app.querySelector("#cv-close").addEventListener("click", removeApp);
    app.querySelector("#cv-scan").addEventListener("click", () => {
      if (!loading) runScan();
    });

    attachHeaderDrag();
  };

  const renderSources = () => {
    if (!sources || sources.length === 0) {
      return `<div class="cv-sub">No sources to display.</div>`;
    }

    return `
      <ul class="cv-sources">
        ${sources.slice(0, 6).map((s) => {
      const title = s.title ? String(s.title).trim() : "";
      const url = s.url || "";
      const host = safeHostname(url);

      const institution = s.institution || "—";
      const published = formatDate(s.published_at);
      const sim = (s.similarity_percent == null) ? "—" : `${s.similarity_percent}%`;

      return `
            <li class="cv-source">
              <span class="cv-dot"></span>
              <div class="cv-source-text">
                <div class="cv-source-title" title="${title}">${title || "(No title)"}</div>

                <div class="cv-source-meta">
                  <span class="cv-chip" title="${institution}">${institution}</span>
                  <span class="cv-chip">${published}</span>
                  <span class="cv-chip">Similarity: ${sim}</span>

                  <span class="cv-link">
                    ${url ? `<a href="${url}" target="_blank" rel="noreferrer">${host || "Open"}</a>` : "—"}
                  </span>
                </div>
              </div>
            </li>
          `;
    }).join("")}
      </ul>
    `;
  };

  // UI 2: Replace Confidence with Matched Sources + Total Sources
  const renderConfidence = () => {
    const avgSim = (avgSimilarityPercent == null) ? "—" : `${avgSimilarityPercent}%`;

    const matched = (matchedSources == null) ? "—" : String(matchedSources);
    const total = (totalSources == null) ? "—" : String(totalSources);

    app.innerHTML = `
      <div class="cv-card screen-confidence">
        <div class="cv-header">
          <div class="cv-title">
            Cross Validate <span class="cv-badge">RESULT</span>
          </div>
          <button class="cv-close" id="cv-close" title="Close">×</button>
        </div>

        <div class="cv-body">
          <div class="cv-metric">
            <h1>Results</h1>
          </div>

          <div class="cv-sub" style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom: 8px;">
            <span class="cv-pill cv-pill-strong">Matched sources: ${matched}</span>
            <span class="cv-pill">Total sources: ${total}</span>
            <span class="cv-pill">Similarity: ${avgSim}</span>
          </div>

          ${statusMessage ? `<div class="cv-sub">${statusMessage}</div>` : ""}

          <div class="cv-divider"></div>

          <div class="cv-section-title">Sources</div>

          ${renderSources()}

          ${errorMessage ? `<div class="cv-error">Error: ${errorMessage}</div>` : ""}

          <div class="cv-actions" style="margin-top: 14px;">
            <button class="cv-btn" id="cv-scan-again" ${loading ? "disabled" : ""}>
              ${loading ? `<span class="cv-spinner" aria-hidden="true"></span> Scanning…` : "Scan"}
            </button>
            <button class="cv-btn-secondary" id="cv-cancel" ${loading ? "disabled" : ""}>Back</button>
          </div>

          <div class="cv-footer-hint">API: http://localhost:5000</div>
        </div>
      </div>
    `;

    app.querySelector("#cv-close").addEventListener("click", removeApp);
    app.querySelector("#cv-cancel").addEventListener("click", () => {
      if (loading) return;
      screen = "small";
      render();
    });

    app.querySelector("#cv-scan-again").addEventListener("click", () => {
      if (loading) return;
      runScan();
    });

    attachHeaderDrag();
  };

  const render = () => {
    if (screen === "small") renderSmall();
    else renderConfidence();
  };

  // Mount
  document.body.appendChild(app);
  render();
})();
