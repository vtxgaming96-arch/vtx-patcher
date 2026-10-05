#!/data/data/com.termux/files/usr/bin/bash

REPO_USER="vtxgaming96-arch"
REPO_NAME="vtx-patcher"
RAW="https://github.com/$REPO_USER/$REPO_NAME/raw/refs/heads/main"

echo ""
echo "═══════════════════════════════════════════"
echo "   🔧 VTXPATCHER INSTALLER"
echo "═══════════════════════════════════════════"
echo ""

# Step 1: Termux update
echo "[1/5] Updating Termux..."
pkg update -y 2>/dev/null
pkg upgrade -y 2>/dev/null

# Step 2: Dependencies
echo "[2/5] Installing dependencies..."
pkg install -y python openjdk-21 apksigner zipalign android-tools apktool openssl-tool curl wget clang xxd termux-api 2>/dev/null

# Fallback for zipalign
if ! command -v zipalign > /dev/null 2>&1; then
    echo "[!] zipalign not found, trying alternative..."
    pkg install -y aapt 2>/dev/null
fi

# Step 3: Folders
echo "[3/5] Creating folders..."
mkdir -p ~/.local/bin
mkdir -p /sdcard/vtx

# Step 4: Download
echo "[4/5] Downloading VTXPATCHER..."
curl -sL "$RAW/vtx" -o ~/.local/bin/vtxpatcher 2>/dev/null
chmod +x ~/.local/bin/vtxpatcher 2>/dev/null

curl -sL "$RAW/vtx.sh.x" -o ~/.vtx.sh.x 2>/dev/null
chmod +x ~/.vtx.sh.x 2>/dev/null

# Step 5: PATH setup
echo "[5/5] Setting up PATH..."
if ! grep -q '.local/bin' ~/.bashrc; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
fi

# Purane aliases hatao
sed -i '/alias vtx/d' ~/.bashrc 2>/dev/null
sed -i '/alias vtxpatcher/d' ~/.bashrc 2>/dev/null

echo ""
echo "═══════════════════════════════════════════"
echo "   ✅ INSTALLED SUCCESSFULLY"
echo "═══════════════════════════════════════════"
echo ""
echo "Ab chala:"
echo "  source ~/.bashrc"
echo "  vtxpatcher"
echo ""
