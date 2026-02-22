FROM python:3.11-slim

WORKDIR /app

# Instalar make y dependencias de sistema para psycopg2
RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    gcc \
    libpq-dev \
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
