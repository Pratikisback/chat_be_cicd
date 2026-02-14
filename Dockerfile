# ----------------------------
# Base Image
# ----------------------------
FROM python:3.11-slim

# ----------------------------
# Environment Settings
# ----------------------------
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# ----------------------------
# Set Working Directory
# ----------------------------
WORKDIR /app

# ----------------------------
# Install system dependencies
# (Required for psycopg2)
# ----------------------------
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------
# Install Python dependencies
# ----------------------------
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# ----------------------------
# Copy Project Files
# ----------------------------
COPY . .

# ----------------------------
# Expose Port
# ----------------------------
EXPOSE 8000

# ----------------------------
# Default Command
# (Overridden by docker-compose)
# ----------------------------
CMD ["uvicorn", "main.socket_app:app", "--host", "0.0.0.0", "--port", "8000"]
