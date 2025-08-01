# Custom Entrypoint Package Installation

A robust approach to installing Python packages at runtime using a custom entrypoint script.

## 🔧 How It Works

1. Uses a custom entrypoint script to handle package installation
2. Supports error handling and logging
3. More maintainable for complex deployments

## 📁 Structure

```
.
├── Dockerfile            # Base image configuration
├── custom-entrypoint.sh # Installation script
└── requirements.txt     # Base requirements
```

## 🚀 Usage

1. Build the image:

```bash
docker build -t custom-entrypoint-example .
```

2. Run with package URL:

```bash
docker run -e PACKAGE_URL="https://example.com/package.whl" custom-entrypoint-example
```

## ⚙️ Configuration

- `PACKAGE_URL`: URL of the package to install at runtime
- Additional requirements can be added to `requirements.txt`
