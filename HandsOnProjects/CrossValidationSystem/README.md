# Financial News Cross-Validation System

A hackathon project for comparing financial news and disclosures across
multiple sources. The system combines a PostgreSQL ingestion pipeline, semantic
text comparison, a Flask API and a Chrome extension that sends the current page
headline to the local backend.

This repository represents a cloud-ready prototype. It is not presented as a
publicly deployed production service.

## What it does

- Collects financial news from Finnhub, NewsAPI, Alpha Vantage and yfinance
- Normalizes source data into a shared PostgreSQL structure
- Generates sentence embeddings for stored claims
- Searches existing claims for semantically similar headlines
- Attempts source ingestion when a search does not find a sufficient match
- Calculates source support and similarity values
- Returns evidence to a browser-extension interface
- Tracks whether configured sources are active or unavailable

## Architecture

```text
Financial data sources
        ↓
Python ingestion and normalization
        ↓
PostgreSQL articles and claims
        ↓
Semantic search and comparison
        ↓
Flask REST API
        ↓
Chrome extension interface
```

## Technology

- Python and Flask
- PostgreSQL, SQLAlchemy and psycopg2
- Sentence Transformers
- Finnhub, NewsAPI, Alpha Vantage and yfinance
- JavaScript Chrome extension using Manifest V3
- Gunicorn
- Azure-ready application structure

## Project structure

```text
CrossValidationSystem/
├── backend/
│   ├── ingestion/   Source ingestion, normalization and semantic search
│   ├── server/      Flask REST API
│   ├── requirements.txt
│   └── .env.example
└── Frontend/
    └── page-reader-extension-google/
        ├── manifest.json
        ├── background.js
        └── floating.js
```

## Backend setup

### 1. Create and activate a virtual environment

From the `backend` directory:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### 2. Configure PostgreSQL and API keys

Copy `.env.example` to `.env`, then provide your own PostgreSQL details and API
keys. Do not commit the populated file.

```text
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=localhost
DB_PORT=5432
FINNHUB_API_KEY=
NEWSAPI_KEY=
ALPHAVANTAGE_API_KEY=
PORT=5000
```

### 3. Run ingestion

```powershell
python -m ingestion.ingest
```

You can also run a title search from the command line:

```powershell
python -m ingestion.run_title_search "Example financial headline"
```

### 4. Start the API

```powershell
python -m server.app
```

The default local API address is `http://localhost:5000`. A `GET /` request
returns the service health response, while the extension sends headlines to
`POST /receive`.

## Chrome extension setup

1. Start the backend on port `5000`.
2. Open `chrome://extensions` in Chrome.
3. Enable **Developer mode**.
4. Select **Load unpacked**.
5. Choose `Frontend/page-reader-extension-google`.
6. Open a supported page and select the extension icon.

The extension is currently configured for the local backend URL. Update both
`manifest.json` and `background.js` if the API address changes.

## Limitations

- The quality of a result depends on source availability and API limits.
- Similarity and support values are indicators, not guarantees that a report is
  true or false.
- The source configuration currently uses example US-market symbols.
- The first run may download the sentence-transformer model.
- This prototype requires additional authentication, validation, monitoring and
  deployment configuration before production use.

## Security

- Keep API keys and PostgreSQL credentials in `.env` or a managed secret store.
- Never commit populated environment files.
- Restrict CORS and database access before exposing the API outside a local or
  controlled environment.
- Review third-party API terms before collecting or redistributing data.

## Status

Hackathon prototype and cloud-ready architecture. No public deployment is
claimed.
