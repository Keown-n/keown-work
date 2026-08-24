# Browser-Agent MCP Server

A custom Model Context Protocol (MCP) server that gives an MCP-compatible AI
client a controlled set of browser-automation tools through Playwright.

The project was built to explore LLM-guided web research and data extraction.
It supports persistent browser sessions, paced interactions, screenshots and
structured page content. It does not guarantee access to sites that restrict
automation, and it should only be used where automation is permitted.

## What it can do

- Launch Chromium in headful or headless mode
- Navigate to a URL and handle common consent prompts
- Type, click, scroll and wait for page elements
- Run a browser-based search workflow
- Capture full-page screenshots
- Return screenshots as Base64 data for visual analysis
- Extract visible text and structured JSON or JSON-LD
- Save and reuse Playwright storage state
- Close the browser and clean up the active session

## Technology

- Python 3.14 or newer
- Playwright
- FastMCP through the `mcp` Python package
- `uv` for dependency and environment management
- JSON storage state for persistent sessions

## Project structure

```text
BrowserAgent/
├── browser.py      Main Chromium-based MCP server
├── browser2.py     Alternative Microsoft Edge implementation
├── pyproject.toml  Python project and dependency configuration
├── screenshots/    Generated at runtime and ignored by Git
└── sessions/       Generated at runtime and ignored by Git
```

## Local setup

### 1. Install `uv`

Follow the installation instructions in the
[`uv` documentation](https://docs.astral.sh/uv/getting-started/installation/).

### 2. Install the project dependencies

From this directory, run:

```bash
uv sync
uv run playwright install chromium
```

### 3. Test the MCP server

```bash
uv run browser.py
```

The server communicates over standard input/output, so it will normally be
started by an MCP client rather than used as a standalone web application.

## Claude Desktop configuration

Add an entry similar to the following to `claude_desktop_config.json`. Replace
the placeholder path with the absolute path to this directory.

```json
{
  "mcpServers": {
    "browser-agent": {
      "command": "uv",
      "args": [
        "--directory",
        "C:/absolute/path/to/keown-work/HandsOnProjects/BrowserAgent",
        "run",
        "browser.py"
      ]
    }
  }
}
```

Restart Claude Desktop after saving the configuration.

## Optional runtime directory

Screenshots and saved sessions default to this project directory. To use a
different location, set `BROWSER_AGENT_DATA_DIR` before starting the server.

PowerShell example:

```powershell
$env:BROWSER_AGENT_DATA_DIR = "C:\path\to\browser-agent-data"
uv run browser.py
```

## Responsible use

- Follow the terms and automation policies of every website you access.
- Do not use saved sessions on shared or untrusted machines.
- Never commit session files because they may contain authentication state.
- Complete CAPTCHA or other human-verification steps manually when required.
- Review extracted information before relying on it.

## Status

This is a portfolio and learning project. The source demonstrates the MCP tool
interface and Playwright workflow; it is not presented as a hosted production
service.
