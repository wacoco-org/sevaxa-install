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

VERSION="0.0.1"
URL="https://github.com/wacoco-org/sevaxa-admin/releases/download/v${VERSION}/sevaxa_${VERSION}_${OS}_${ARCH}.tar.gz"

echo "Downloading sevaxa ${VERSION} for ${OS}/${ARCH}..."
curl -sSL "$URL" | tar -xz

echo "Installing sevaxa..."
sudo mv sevaxa /usr/local/bin/sevaxa
sudo chmod +x /usr/local/bin/sevaxa

echo "Installed sevaxa version $VERSION"
