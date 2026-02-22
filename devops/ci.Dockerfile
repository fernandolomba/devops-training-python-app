FROM python:3.6-slim

WORKDIR /app

# Instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir \
    -r requirements.txt \
    flake8 \
    mypy \
    black \
    coverage \
    pytest

