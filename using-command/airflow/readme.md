# Command-Based Airflow Package Installation

Runtime package installation for Apache Airflow using command override.

## 🔧 Implementation

Add these commands to your `docker-compose.yml`:

```yaml
airflow-webserver:
  command: bash -c "pip install --upgrade --no-cache-dir ${PACKAGE_URL} && /entrypoint webserver"

airflow-scheduler:
  command: bash -c "pip install --upgrade --no-cache-dir ${PACKAGE_URL} && /entrypoint scheduler"

airflow-worker:
  command: bash -c "pip install --upgrade --no-cache-dir ${PACKAGE_URL} && /entrypoint celery worker"

airflow-triggerer:
  command: bash -c "pip install --upgrade --no-cache-dir ${PACKAGE_URL} && /entrypoint triggerer"
```

## 🚀 Usage

```bash
docker compose --env-file prod.env up -d
```

## ⚙️ Configuration

Set your package URL in `prod.env`:

```env
PACKAGE_URL=https://files.pythonhosted.org/packages/py2.py3/s/six/six-1.17.0-py2.py3-none-any.whl
```

⚠️ **Security Note**: Never commit `prod.env` to version control. It contains sensitive information.
