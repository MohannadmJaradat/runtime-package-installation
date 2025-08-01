FROM apache/airflow:2.10.5

# Install system dependencies for building Python packages
USER root
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    libpq-dev \
    curl\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to airflow user
USER airflow

# Copy requirements file
COPY requirements.txt /requirements.txt

# Install additional dependencies
RUN pip install --no-cache-dir -r /requirements.txt

# Copy custom entrypoint
COPY custom-entrypoint.sh /custom-entrypoint.sh
USER root
RUN chmod +x /custom-entrypoint.sh
USER airflow

# Set custom entrypoint
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/custom-entrypoint.sh"]
