FROM python:3.6-slim

# Establecemos el directorio de trabajo
WORKDIR /app

COPY requirements.txt .

# Instalamos make y herramientas básicas de compilación
RUN pip install -r requirements.txt flake8 mypy black coverage pytest

