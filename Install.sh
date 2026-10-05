#!/data/data/com.termux/files/usr/bin/bash

REPO_USER="vtxgaming96-arch"
REPO_NAME="vtx-patcher"
RAW="https://github.com/$REPO_USER/$REPO_NAME/raw/refs/heads/main"

echo "[*] Installing VTX Patcher..."
pkg install -y python openjdk-21 apksigner zipalign openssl-tool curl wget shc xxd

mkdir -p ~/.local/bin
mkdir -p /sdcard/vtx

# Binary download
echo "[*] Downloading vtx..."
curl -sL "$RAW/vtx" -o ~/.local/bin/vtx
chmod +x ~/.local/bin/vtx

# Original script bhi (shc ke liye)
if [ -f /sdcard/vtx/vtx.sh ]; then
    echo "[✓] vtx.sh already exists"
else
    echo "[!] vtx.sh nahi mili — tu manually daal"
fi

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
