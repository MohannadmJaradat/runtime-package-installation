FROM python:3.11-slim

# System deps (optional, only needed for some builds)
RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy Python requirements (if needed)
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy custom entrypoint script
COPY custom-entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh

# Set custom entrypoint
ENTRYPOINT ["/custom-entrypoint.sh"]
