import asyncio
import os
import random
from datetime import datetime
from pathlib import Path
from playwright.async_api import async_playwright, BrowserContext, Page, TimeoutError
from playwright_stealth import stealth_async
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("browser-agent")

# Globals for persistent browser
playwright = None
browser = None
context: BrowserContext = None
current_page: Page = None

# Screenshots folder
SCREENSHOTS_DIR = Path("screenshots")
SCREENSHOTS_DIR.mkdir(exist_ok=True)


@mcp.tool()
async def launch_browser(headless: bool = False) -> str:
    """Launch installed Microsoft Edge with stealth preparation."""
    global playwright, browser, context
    if context is not None:
        return "Browser already running."

    playwright = await async_playwright().start()
    try:
        browser = await playwright.chromium.launch(
            channel="msedge",  # Uses your installed Microsoft Edge
            headless=headless,
            args=[
                "--disable-blink-features=AutomationControlled",
                "--no-sandbox",
                "--disable-infobars",
                "--disable-dev-shm-usage",
            ]
        )
    except Exception as e:
        return f"Edge launch failed: {str(e)[:250]}. Run 'playwright install msedge' and ensure Edge is installed."

    context = await browser.new_context(
        viewport={"width": 1280, "height": 900},
        user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0",
        locale="en-ZA",
        timezone_id="Africa/Johannesburg",
        geolocation={"latitude": -29.8587, "longitude": 31.0218},  # Durban area
        permissions=["geolocation"]
    )
    return f"Microsoft Edge launched successfully (headless: {headless})."


@mcp.tool()
async def navigate(url: str) -> str:
    """Navigate to URL, apply stealth, inline consent handling, return status."""
    global current_page
    if context is None:
        return "Launch browser first!"

    current_page = await context.new_page()
    await stealth_async(current_page)  # Stealth per page

    await current_page.goto(url, wait_until="domcontentloaded", timeout=60000)

    # Inline consent handling (no separate function → no NameError)
    consent_status = "No consent banner detected."
    consent_selectors = [
        "button[id='L2AGLb']",                     # Google classic
        "button:has-text('Accept all')",
        "button:has-text('I agree')",
        "button:has-text('Allow all cookies')",
        "#onetrust-accept-btn-handler",
    ]
    for selector in consent_selectors:
        try:
            btn = current_page.locator(selector)
            if await btn.is_visible(timeout=5000):
                await btn.click(timeout=10000)
                await asyncio.sleep(2.5)
                consent_status = f"Consent banner accepted using selector: {selector}"
                break
        except TimeoutError:
            continue
        except Exception as e:
            consent_status = f"Consent handling error: {str(e)[:150]}"
            break

    title = await current_page.title()
    return f"Navigated to {url}\nPage title: {title}\nConsent status: {consent_status}"


@mcp.tool()
async def type_text(selector: str, text: str) -> str:
    if current_page is None:
        return "No active page!"
    try:
        await current_page.fill(selector, "")
        for char in text:
            await current_page.type(selector, char, delay=random.randint(70, 200))
        return f"Typed '{text}' with human-like delays."
    except Exception as e:
        return f"Type failed: {str(e)[:200]}"


@mcp.tool()
async def human_like_interact() -> str:
    if current_page is None:
        return "No page!"
    try:
        for _ in range(random.randint(2, 5)):
            await current_page.mouse.move(
                random.randint(100, 1100),
                random.randint(100, 700),
                steps=random.randint(10, 20)
            )
            await asyncio.sleep(random.uniform(0.4, 1.3))
            await current_page.evaluate("window.scrollBy(0, window.innerHeight * 0.3)")
            await asyncio.sleep(random.uniform(0.5, 1.4))
        return "Human-like mouse movements and scrolling performed."
    except Exception as e:
        return f"Human interact failed: {str(e)[:150]}"


@mcp.tool()
async def click(selector: str) -> str:
    if current_page is None:
        return "No active page!"
    try:
        await current_page.click(selector, timeout=12000)
        return f"Clicked element: {selector}"
    except Exception as e:
        return f"Click failed: {str(e)[:200]}"


@mcp.tool()
async def screenshot(name: str = None) -> str:
    if current_page is None:
        return "No active page!"
    if name is None:
        name = datetime.now().strftime("%Y%m%d_%H%M%S")
    filepath = SCREENSHOTS_DIR / f"{name}.png"
    await current_page.screenshot(path=str(filepath), full_page=True)
    return f"Screenshot saved to: {os.path.abspath(filepath)}"


@mcp.tool()
async def get_text(selector: str) -> str:
    if current_page is None:
        return "No active page!"
    try:
        text = await current_page.inner_text(selector, timeout=8000)
        return text.strip() or "(no text found)"
    except Exception as e:
        return f"Text extraction error: {str(e)[:150]}"


if __name__ == "__main__":
    import sys
    print("browser-agent MCP server (Edge + fixed consent) starting...", file=sys.stderr)
    mcp.run(transport="stdio")