#!/usr/bin/env bash
set -euo pipefail

version=16.15.1
distribution=node-v$version-linux-x64
filename=$distribution.tar.xz
url=https://nodejs.org/dist/v$version/$filename
destination=/opt/node

workdir="$(mktemp -d)"
echo "Using workdir \"$workdir\""

pushd "$workdir"

wget "$url"
tar -xf "$filename"
sudo mv "$distribution" "$destination"

# Create links
sudo ln -s /opt/node/bin/npm /bin/npm
sudo ln -s /opt/node/bin/node /bin/node
sudo ln -s /opt/node/bin/npx /bin/npx

popd
rm -rf "$workdir"
