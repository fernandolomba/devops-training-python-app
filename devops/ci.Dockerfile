FROM python:3.11-slim

WORKDIR /app

# make + dependencias de sistema para psycopg2
RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Dependencias de la app + herramientas de CI
# black[jupyter] es necesario porque el Makefile chequea lab/*.ipynb
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt \
    flake8 \
    mypy \
    "black[jupyter]" \
    coverage \
    pytest
