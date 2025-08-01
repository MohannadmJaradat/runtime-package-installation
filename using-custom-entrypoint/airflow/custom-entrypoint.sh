#!/bin/bash
set -e

# Install package if URL is provided
if [ -n "$PACKAGE_URL" ]; then
    echo "Installing package from: $PACKAGE_URL"
    pip install --upgrade --no-cache-dir "$PACKAGE_URL"
    echo "Package installed successfully"
fi

# Execute original Airflow entrypoint with all arguments
exec /entrypoint "$@"