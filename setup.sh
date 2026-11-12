#!/bin/bash
set -euo pipefail

# Use only Linux binaries (helps on WSL when Windows PATH leaks in)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

APP_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing system packages"
sudo apt-get update
sudo apt-get install -y python3 python3-pip python3-venv apache2

# B(i) Install Python dependencies


# B(ii) Prepare database directory


# B(iii) Deploy static assets to /var/www/html/app


# B(iv) Move and enable the Apache config file app.conf


echo ""
echo "Setup complete."
echo "Start the app with: ./run.sh"
echo "Then open: http://localhost/"
