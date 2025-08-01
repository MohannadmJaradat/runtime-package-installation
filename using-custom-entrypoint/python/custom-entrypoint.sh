#!/bin/bash
set -e

if [ -n "$PACKAGE_URL" ]; then
    echo "Installing package from https://files.pythonhosted.org/packages/py2.py3/s/six/six-1.17.0-py2.py3-none-any.whl"
    pip install --upgrade --no-cache-dir https://files.pythonhosted.org/packages/py2.py3/s/six/six-1.17.0-py2.py3-none-any.whl
fi

exec python /app.py "$@"
