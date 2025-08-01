# Command-Based Runtime Package Installation

A minimalist approach to installing Python packages at runtime in Docker containers.

## 🔧 How It Works

1. Uses Docker Compose's `command` to run installation before the main application
2. Reads package URL from environment variables
3. No additional scripts or Dockerfile modifications needed

## 📦 Usage

1. Set your package URL in the environment:

```bash
PACKAGE_URL=https://files.pythonhosted.org/packages/py2.py3/s/six/six-1.17.0-py2.py3-none-any.whl
```

1. Run with Docker Compose:

```bash
docker compose up
```

## 📋 Files

- `docker-compose.yml` - Container configuration
- `.env` - Environment variables (optional)
