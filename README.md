# Runtime Package Installation Patterns for Docker

This repository demonstrates two approaches for installing Python packages at runtime in Docker containers:

## 📁 Project Structure

```
├── using-command/              # Command-based approach
│   ├── airflow/               # Airflow implementation
│   └── python/                # Basic Python implementation
└── using-custom-entrypoint/   # Custom entrypoint approach
    ├── airflow/               # Airflow implementation
    └── python/                # Basic Python implementation
```

## 🔍 Approaches

1. **Command-Based Installation**
   - Uses Docker Compose `command` override
   - Simpler implementation
   - No additional scripts needed
   - Located in [using-command/](using-command/)

2. **Custom Entrypoint Installation**
   - Uses a custom entrypoint script
   - More flexible and maintainable
   - Better error handling
   - Located in [using-custom-entrypoint/](using-custom-entrypoint/)

## 🚀 Getting Started

Each implementation includes its own documentation and examples. Choose the approach that best fits your needs:

- For a simple solution, start with the command-based approach
- For more complex deployments, use the custom entrypoint approach
