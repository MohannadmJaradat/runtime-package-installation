# Custom Entrypoint Airflow Package Installation

A robust approach for installing packages at runtime in Apache Airflow using a custom entrypoint script.

## 🔍 Overview

This implementation uses a custom entrypoint script to dynamically install Python packages in Airflow containers during startup. This method provides better error handling and maintainability compared to command overrides.

## 📁 Project Structure

```
.
├── custom-entrypoint.sh    # Custom installation script
├── docker-compose.yml      # Docker services configuration
├── Dockerfile             # Custom Airflow image definition
├── prod.env              # Environment variables
└── requirements.txt      # Base Python dependencies
```

## 🔧 Implementation Details

1. The `custom-entrypoint.sh` script handles package installation:

```bash
#!/bin/bash
if [ -n "$PACKAGE_URL" ]; then
    echo "Installing package from: $PACKAGE_URL"
    pip install --upgrade --no-cache-dir "$PACKAGE_URL"
fi

exec /entrypoint "$@"
```

2. The `Dockerfile` includes the entrypoint:

```dockerfile
FROM apache/airflow:2.7.1
COPY custom-entrypoint.sh /opt/airflow/custom-entrypoint.sh
RUN chmod +x /opt/airflow/custom-entrypoint.sh
ENTRYPOINT ["/opt/airflow/custom-entrypoint.sh"]
```

1. The `docker-compose.yml` services configuration:

```yaml
version: '3'
services:
  airflow-webserver:
    build: .
    environment:
      - PACKAGE_URL=${PACKAGE_URL}
  # ...other services...
```

## 🚀 Usage

1. Set your package URL in `prod.env`:

```env
PACKAGE_URL=https://example.com/package.whl
```

1. Build and start the services:

```bash
docker compose --env-file prod.env up -d
```

## ✅ Verification Steps

1. Check container logs for successful installation:

```bash
docker compose logs airflow-webserver
```

1. Verify package installation inside container:

```bash
docker compose exec airflow-webserver pip list
```

## 🔒 Security Considerations

- Only install packages from trusted sources
- Use package checksums when possible
- Consider using private PyPI repositories
- Validate package URLs before deployment

## 📝 Notes

- This method supports both wheel and source distributions
- Package installation happens before Airflow services start
- Base requirements are installed during image build
- Runtime packages are installed during container startup
- Original Airflow entrypoint functionality is preserved

## 🤝 Contributing

⚠️ **Security Note**: Never commit `prod.env` to version control. It contains sensitive information.

Feel free to submit issues and enhancement requests!
