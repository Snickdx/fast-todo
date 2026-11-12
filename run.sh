#!/bin/bash
set -euo pipefail

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

APP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$APP_DIR"

# shellcheck disable=SC1091
source .venv/bin/activate

mkdir -p data
exec uvicorn main:app --host 0.0.0.0 --port 5000
