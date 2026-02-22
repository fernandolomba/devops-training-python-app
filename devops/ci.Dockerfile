# La version 3.6 es antigua y parece que da problemas
FROM python:3.11-slim

WORKDIR /app

# Instalar make
RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt \
    flake8 \
    mypy \
    black \
    coverage \
    pytest
