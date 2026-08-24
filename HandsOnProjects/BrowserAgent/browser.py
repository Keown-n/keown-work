import asyncio
import os
import random
import json
import base64
from datetime import datetime
from pathlib import Path
from typing import Optional

from playwright.async_api import async_playwright, BrowserContext, Page, TimeoutError
try:
    from playwright_stealth import stealth_async
except ImportError:
    try:
        from tf_playwright_stealth import stealth_async
    except ImportError:
        async def stealth_async(page): pass

from mcp.server.fastmcp import FastMCP

mcp = FastMCP("browser-agent")

# Globals
_playwright = None
_browser = None
_context: Optional[BrowserContext] = None
_current_page: Optional[Page] = None

# Folders
BASE_DIR = Path(
    os.getenv("BROWSER_AGENT_DATA_DIR", str(Path(__file__).resolve().parent))
)
SCREENSHOTS_DIR = BASE_DIR / "screenshots"
SESSIONS_DIR = BASE_DIR / "sessions"
SCREENSHOTS_DIR.mkdir(exist_ok=True)
SESSIONS_DIR.mkdir(exist_ok=True)


@mcp.tool()
async def launch_browser(headless: bool = False, session_name: str = None) -> str:
    """
    Launch Chromium with enhanced stealth flags and optional persistent session.
    - session_name: If provided, saves/loads cookies and storage state.
    """
    global _playwright, _browser, _context
    if _context is not None:
        return "Browser already running. Use close_browser() to restart if needed."

    _playwright = await async_playwright().start()
    
    storage_state = None
    if session_name:
        session_path = SESSIONS_DIR / f"{session_name}.json"
        if session_path.exists():
            storage_state = str(session_path)

    # Randomize viewport slightly for unique fingerprint
    width = random.randint(1250, 1350)
    height = random.randint(850, 950)

    _browser = await _playwright.chromium.launch(
        headless=headless,
        args=[
            "--disable-blink-features=AutomationControlled",
            "--no-sandbox",
            "--disable-infobars",
            "--disable-dev-shm-usage",
            "--use-fake-ui-for-media-stream", # Helps skip some permission prompts
        ]
    )
    
    _context = await _browser.new_context(
        viewport={"width": width, "height": height},
        user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36",
        locale="en-ZA",
        timezone_id="Africa/Johannesburg",
        geolocation={"latitude": -29.8587, "longitude": 31.0218},
        permissions=["geolocation"],
        storage_state=storage_state,
        extra_http_headers={
            "Accept-Language": "en-ZA,en-GB;q=0.9,en-US;q=0.8,en;q=0.7",
            "Referer": "https://www.google.com/"
        }
    )
    
    msg = f"Browser launched (headless: {headless}, viewport: {width}x{height})"
    if session_name:
        msg += f" with session '{session_name}'"
    return msg


@mcp.tool()
async def navigate(url: str) -> str:
    """Navigate to URL, apply stealth, and handle common consent banners."""
    global _current_page
    if _context is None:
        return "Error: Browser not launched. Call launch_browser() first."

    _current_page = await _context.new_page()
    await stealth_async(_current_page)

    try:
        await _current_page.goto(url, wait_until="domcontentloaded", timeout=60000)
    except Exception as e:
        return f"Navigation failed: {str(e)}"

    consent_msg = await handle_consent()
    title = await _current_page.title()
    return f"Navigated to {url}\nTitle: {title}\n{consent_msg}"


@mcp.tool()
async def organic_search(query: str) -> str:
    """
    Perform a Google search manually (type into search box) to avoid bot detection.
    This is much stealthier than direct URL navigation.
    """
    global _current_page
    if _context is None: return "Browser not launched."
    
    _current_page = await _context.new_page()
    await stealth_async(_current_page)
    
    try:
        # 1. Go to Google homepage
        await _current_page.goto("https://www.google.com", wait_until="networkidle")
        await handle_consent()
        
        # 2. Find search box (usually name="q")
        search_selector = "textarea[name='q'], input[name='q']"
        await _current_page.wait_for_selector(search_selector, timeout=10000)
        
        # 3. Type human-like
        await _current_page.click(search_selector)
        for char in query:
            await _current_page.type(search_selector, char, delay=random.randint(100, 250))
            if random.random() < 0.1: # 10% chance of small pause between words
                await asyncio.sleep(random.uniform(0.3, 0.7))
        
        # 4. Press Enter
        await _current_page.keyboard.press("Enter")
        await _current_page.wait_for_load_state("networkidle")
        
        title = await _current_page.title()
        return f"Organic search for '{query}' complete. Current page: {title}"
    except Exception as e:
        return f"Organic search failed: {str(e)}"


@mcp.tool()
async def handle_consent() -> str:
    """Dismiss common cookie/consent banners."""
    if _current_page is None: return "No active page."
    selectors = [
        "button[id='L2AGLb']",
        "button:has-text('Accept all')",
        "button:has-text('I agree')",
        "button:has-text('Allow all cookies')",
        "#onetrust-accept-btn-handler",
        "button:has-text('Zaakceptuj wszystko')", # Polish variant seen in screenshots
    ]
    for sel in selectors:
        try:
            btn = _current_page.locator(sel)
            if await btn.is_visible(timeout=3000):
                await btn.click(timeout=5000)
                await asyncio.sleep(1)
                return f"Consent banner accepted ({sel})."
        except:
            pass
    return "No visible consent banner detected."


@mcp.tool()
async def human_like_interact() -> str:
    """Perform random mouse movements and scrolls to look human."""
    if _current_page is None: return "No active page."
    try:
        # Random mouse movements
        for _ in range(random.randint(3, 8)):
            x = random.randint(100, 1000)
            y = random.randint(100, 800)
            await _current_page.mouse.move(x, y, steps=random.randint(10, 30))
            await asyncio.sleep(random.uniform(0.2, 0.8))
        
        # Random scrolls
        await _current_page.evaluate("""
            window.scrollBy({
                top: Math.random() * 500,
                behavior: 'smooth'
            });
        """)
        return "Human-like interaction performed."
    except Exception as e:
        return f"Interaction failed: {str(e)}"


@mcp.tool()
async def wait_for_selector(selector: str, timeout_ms: int = 10000) -> str:
    """Wait for an element to appear."""
    if _current_page is None: return "No active page."
    try:
        await _current_page.wait_for_selector(selector, timeout=timeout_ms)
        return f"Element '{selector}' is now present."
    except TimeoutError:
        return f"Timed out waiting for '{selector}' after {timeout_ms}ms."


@mcp.tool()
async def type_text(selector: str, text: str) -> str:
    """Type text into a field with human-like delays."""
    if _current_page is None: return "No active page."
    try:
        await _current_page.focus(selector)
        await _current_page.fill(selector, "")
        for char in text:
            await _current_page.type(selector, char, delay=random.randint(50, 150))
        return f"Typed text into '{selector}'."
    except Exception as e:
        return f"Type failed: {str(e)}"


@mcp.tool()
async def click(selector: str) -> str:
    """Click an element."""
    if _current_page is None: return "No active page."
    try:
        await _current_page.click(selector, timeout=10000)
        return f"Clicked '{selector}'."
    except Exception as e:
        return f"Click failed: {str(e)}"


@mcp.tool()
async def screenshot(name: str = None) -> str:
    """Take a full-page screenshot and save to disk."""
    if _current_page is None: return "No active page."
    name = name or datetime.now().strftime("%Y%m%d_%H%M%S")
    filepath = SCREENSHOTS_DIR / f"{name}.png"
    await _current_page.screenshot(path=str(filepath), full_page=True)
    return f"Screenshot saved: {os.path.abspath(filepath)}"


@mcp.tool()
async def get_screenshot_base64() -> str:
    """Get a screenshot as a base64 string (useful for feeding to vision models)."""
    if _current_page is None: return "No active page."
    buffer = await _current_page.screenshot(full_page=False)
    encoded = base64.b64encode(buffer).decode('utf-8')
    return f"data:image/png;base64,{encoded}"


@mcp.tool()
async def get_text(selector: str = "body") -> str:
    """Extract inner text from an element."""
    if _current_page is None: return "No active page."
    try:
        return await _current_page.inner_text(selector, timeout=5000)
    except Exception as e:
        return f"Error: {str(e)}"


@mcp.tool()
async def extract_json() -> str:
    """Try to find and parse JSON content on the page."""
    if _current_page is None: return "No active page."
    try:
        content = await _current_page.inner_text("body")
        try:
            parsed = json.loads(content)
            return json.dumps(parsed, indent=2)
        except json.JSONDecodeError:
            pass

        json_ld = await _current_page.evaluate("""
            () => {
                const scripts = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
                return scripts.map(s => s.innerText);
            }
        """)
        if json_ld:
            return json.dumps(json_ld, indent=2)

        return "No clear JSON found on page."
    except Exception as e:
        return f"Extraction failed: {str(e)}"


@mcp.tool()
async def save_session(session_name: str) -> str:
    """Save current cookies and storage state to a session file."""
    if _context is None: return "No active session."
    session_path = SESSIONS_DIR / f"{session_name}.json"
    await _context.storage_state(path=str(session_path))
    return f"Session saved to '{session_name}.json'."


@mcp.tool()
async def close_browser() -> str:
    """Close the browser and clean up."""
    global _playwright, _browser, _context, _current_page
    if _browser:
        await _browser.close()
    if _playwright:
        await _playwright.stop()
    _playwright = _browser = _context = _current_page = None
    return "Browser closed."


if __name__ == "__main__":
    import sys
    print("Browser-Agent MCP (Enhanced Stealth) running...", file=sys.stderr)
    mcp.run(transport="stdio")
