# 🌐 Browser-Agent MCP Server

**A production-ready, stealthy, and semi-autonomous browser agent for Claude Desktop.**

This project exposes a suite of advanced browser automation tools to Claude via the Model Context Protocol (MCP), allowing it to navigate the web, bypass bot detection, and handle complex interactions like a human.

## Key Features

- **Advanced Stealth & Anti-Detection**:
  - Integrated `playwright-stealth`.
  - Randomized viewport dimensions for unique fingerprints.
  - Human-like typing with randomized delays and pauses.
  - Realistic mouse movements and scrolling.
  - Geolocation (Durban-based) and locale (`en-ZA`) spoofing.
- **Bot Mitigation (Organic Search)**:
  - Special `organic_search` tool that avoids direct navigation to Google results by mimicking a human search workflow.
- **Persistent Sessions**:
  - Save and load authentication states (cookies, local storage) to maintain logins between prompts.
- **Rich Visuals**:
  - Full-page screenshots saved to disk.
  - Base64 encoded images for Claude's vision capabilities.
- **Robust Tooling**:
  - Element text extraction, JSON-LD/JSON detection, and waiting for dynamic content.

## Tools Exposed

- `launch_browser`: Start a headful/headless Chromium instance.
- `organic_search`: **Recommended** way to search Google without getting blocked.
- `navigate`: Go to any URL with automatic cookie consent handling.
- `human_like_interact`: Random mouse moves and scrolls to appear human.
- `type_text`: Type into fields with randomized, human-like delays.
- `click`: Interactive element clicking.
- `wait_for_selector`: Robust waiting for dynamic content.
- `screenshot` / `get_screenshot_base64`: Visual feedback for Claude.
- `extract_json`: Automated data extraction from pages.
- `save_session` / `close_browser`: Lifecycle and session management.

## Installation & Setup

1. **Install uv**: If you haven't already, install [uv](https://github.com/astral-sh/uv).
2. **Install Dependencies**:
   ```bash
   uv sync
   uv run playwright install chromium
   ```
3. **Configure Claude Desktop**:
   Open your `claude_desktop_config.json` (typically in `%APPDATA%\Claude\claude_desktop_config.json`) and add:
   ```json
   {
     "mcpServers": {
       "browser-agent": {
         "command": "uv",
         "args": [
           "--directory",
           "C:/Users/Keown Naidoo/Documents/Playwright Agent",
           "run",
           "browser.py"
         ]
       }
     }
   }
   ```
4. **Restart Claude Desktop**: Look for the 🌐 icon in the tool list.

## File Structure

- `browser.py`: Main MCP server implementation with latest enhancements.
- `browser2.py`: Alternative implementation using Microsoft Edge (optional).
- `screenshots/`: Folder where full-page snapshots are saved.
- `sessions/`: Folder where persistent session files are stored.
- `pyproject.toml`: Dependency and project configuration.

##  Important Usage Notes

**If you encounter a CAPTCHA while using the agent:**
1. Launch the browser in headful mode (`headless=False`).
2. Solve the CAPTCHA manually.
3. Call `save_session("trusted_google")`.
4. In future prompts, use `launch_browser(session_name="trusted_google")`.

---
*Created for the [Model Context Protocol](https://modelcontextprotocol.io/)*
