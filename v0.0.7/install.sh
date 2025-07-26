#!/bin/sh
set -e

OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    ARCH="amd64"
elif [ "$ARCH" = "arm64" ] || [ "$ARCH" = "aarch64" ]; then
    ARCH="arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

URL="https://raw.githubusercontent.com/wacoco-org/sevaxa-install/main/latest/sevaxa_latest_${OS}_${ARCH}.tar.gz"

echo "Downloading sevaxa (latest) for ${OS}/${ARCH}..."
curl -sSL "$URL" | tar -xz

echo "Installing sevaxa..."
sudo mv sevaxa /usr/local/bin/sevaxa
sudo chmod +x /usr/local/bin/sevaxa

echo "Installed sevaxa (latest)"
