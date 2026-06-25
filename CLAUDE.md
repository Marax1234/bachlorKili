<project_context>
Studienarbeit
TITLE: Sentiment-Driven Market Analysis — Design and Evaluation of an LLM-Based Multi-Source Data Pipeline

INSTITUTION: DHBW Stuttgart | Computer Science (Informatik)

AUTHOR: Max Hiller

TOPIC SUMMARY:
This thesis designs, implements, and empirically evaluates an automated pipeline that:
1. Aggregates public text from three heterogeneous sources (The Guardian API, Reddit, Bluesky AT Protocol).
2. Applies a 4-layer progressive filtering strategy to reduce noise.
3. Uses an LLM (via Groq API, open-source ~20B model) for sentiment classification (score −1.0 to +1.0) with economic relevance weighting (0.0 to 1.0).
4. Correlates hourly aggregated, relevance-weighted sentiment with stock price data (Alpaca Markets API) using Pearson correlation and lag analysis (±6 hours).
5. Presents results in a React-based VS-mode dashboard for side-by-side brand comparison.

TECH STACK:
- Backend: Python 3.12+, FastAPI, SQLAlchemy 2.0 async, PostgreSQL 16
- Frontend: React 19 + TypeScript
- LLM Inference: Groq API (open-source 20B model)
- Market Data: Alpaca Markets API (OHLCV)
- Content Sources: The Guardian API, Reddit Public JSON, Bluesky AT Protocol
- Architecture: Domain-Driven Vertical Slices, Strategy Pattern for content source plugins
- Infrastructure: Docker
</project_context>