# 🤖 FastAPI Text Generation with Ollama & Docker

> A containerized REST API for AI-powered story generation using local LLMs via Ollama — no cloud API keys required.

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-green?logo=fastapi)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker)
![Ollama](https://img.shields.io/badge/Ollama-Local%20LLM-black?logo=ollama)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📌 Overview

This project demonstrates how to build and containerize a **FastAPI application** that serves AI-generated text using a **locally running LLM via Ollama**. It exposes a single REST endpoint that accepts a prompt and returns a creatively generated story — entirely offline, with no external API dependencies.

Built as part of the **Black Elephant AI Learning Ecosystem** — a hands-on Applied AI engineering initiative.

---

## 🏗️ Architecture

```
User / Swagger UI
      │
      ▼
FastAPI App (Docker Container : Port 8000)
      │
      │  HTTP → host.docker.internal:11434
      ▼
Ollama (Running on Host Machine)
      │
      ▼
Local LLM Model (qwen2.5:0.5b)
```

---

## ✨ Features

- 🚀 **FastAPI** with auto-generated Swagger UI at `/docs`
- 🐳 **Fully Dockerized** — single command to build and run
- 🧠 **Local LLM inference** via Ollama (no API key, no cloud, no cost)
- 📦 **Lightweight base image** — Python 3.11-slim
- 🔌 **Extensible** — easily swap Ollama model or add new endpoints

---

## 🧰 Tech Stack

| Layer | Technology |
|---|---|
| API Framework | FastAPI + Uvicorn |
| AI Inference | Ollama (`qwen2.5:0.5b`) |
| Containerization | Docker |
| Language | Python 3.11 |
| API Docs | Swagger UI (built-in) |

---

## 📁 Project Structure

```
Text_generation/
├── main_ollama.py       # FastAPI app with /generate-story endpoint
├── Dockerfile           # Container build instructions
├── requirements.txt     # Python dependencies
├── scripts.sh           # Handy Docker commands reference
└── README.md            # This file
```

---

## ⚙️ Prerequisites

Before running this project, ensure you have:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- [Ollama](https://ollama.com) installed on your machine
- The `qwen2.5:0.5b` model pulled locally

```bash
# Pull the model
ollama pull qwen2.5:0.5b

# Verify it's available
ollama list
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/fastapi-ollama-text-generation.git
cd fastapi-ollama-text-generation
```

### 2. Start Ollama on Your Machine

```bash
ollama serve
```

### 3. Build the Docker Image

```bash
docker build -t text-generation .
```

### 4. Run the Container

```bash
docker run -d -p 8000:8000 --add-host=host.docker.internal:host-gateway text-generation
```

### 5. Access the API

Open your browser and navigate to:

```
http://localhost:8000/docs
```

---

## 📡 API Reference

### `POST /generate-story`

Generates a creative story based on the provided prompt.

**Request Body:**
```json
{
  "prompt": "India",
  "max_tokens": 500
}
```

**Response:**
```json
{
  "story": "Once upon a time, in the vibrant land of India..."
}
```

**Example using curl:**
```bash
curl -X POST "http://localhost:8000/generate-story" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "India", "max_tokens": 500}'
```

---

## 🛑 Managing the Container

```bash
# View running containers
docker ps

# Stop the container
docker stop <CONTAINER_ID>

# Restart an existing container
docker restart <CONTAINER_ID>

# View logs
docker logs <CONTAINER_ID>
```

---

## 🔄 Switching Models

To use a different Ollama model, update this line in `main_ollama.py`:

```python
OLLAMA_MODEL = "qwen2.5:0.5b"  # Change to any model available via `ollama list`
```

Then rebuild the Docker image:
```bash
docker build -t text-generation .
```

---

## 🗺️ Roadmap

- [ ] Add `/generate-summary` endpoint
- [ ] Add `/translate` endpoint
- [ ] Support model selection via request parameter
- [ ] Add streaming response support
- [ ] Integrate with Gemini API as alternative backend
- [ ] Add authentication middleware

---

## 👩‍💻 Author

**Swati** — AI Entrepreneur & Applied AI Consultant  
Building production-grade Generative AI and Agentic AI solutions for enterprise clients.  
Part of the **Black Elephant AI Learning Ecosystem**.

---

📄 License


This project is licensed under the MIT License — see the LICENSE file for details.
This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
