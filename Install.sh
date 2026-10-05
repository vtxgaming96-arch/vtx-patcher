#!/data/data/com.termux/files/usr/bin/bash

REPO_USER="vtxgaming96-arch"
REPO_NAME="vtx-patcher"
RAW="https://github.com/$REPO_USER/$REPO_NAME/raw/refs/heads/main"

echo "[*] Installing VTX Patcher..."
pkg install -y python openjdk-21 apksigner zipalign openssl-tool curl wget shc xxd gcc

mkdir -p ~/.local/bin
mkdir -p /sdcard/vtx

# vtx binary download
echo "[*] Downloading vtx binary..."
curl -sL "$RAW/vtx" -o ~/.local/bin/vtx
chmod +x ~/.local/bin/vtx

# encrypted script download (vtx binary isko dhundhta hai)
echo "[*] Downloading vtx.sh.x..."
curl -sL "$RAW/vtx.sh.x" -o ~/.vtx.sh.x
chmod +x ~/.vtx.sh.x

# PATH add
if ! grep -q '.local/bin' ~/.bashrc; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
fi
sed -i '/alias vtx=/d' ~/.bashrc 2>/dev/null

echo ""
echo "[✓] Installed!"
echo ""
echo "Ab chala:"
echo "  source ~/.bashrc"
echo "  vtx"
