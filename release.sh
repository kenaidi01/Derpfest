#!/bin/bash

# === Configuration ===
ROM_NAME="DerpFest-v15.2-20250515-munch-Community-Stable.zip"
ROM_PATH="out/target/product/munch/$ROM_NAME"
GIT_TAG="20250515"
REPO="kenaidi01/Derpfest"

# === Check if file exists ===
if [ ! -f "$ROM_PATH" ]; then
    echo "❌ ROM file not found at $ROM_PATH"
    exit 1
fi

# === Create GitHub Release (requires gh CLI) ===
gh release create "$GIT_TAG" "$ROM_PATH" \
  --repo "$REPO" \
  --title "DerpFest $GIT_TAG Release (munch)" \
  --notes "
## 📲 Installation Guide

### 🔒 Encrypted Devices (Use OrangeFox Recovery)
1. Flash latest firmware  
2. Flash **DerpFest ROM**  
3. Reflash OrangeFox (or tick 'Reflash after OTA')  
4. Reboot to Recovery  
5. Flash GApps (if you flashed Vanilla ROM)  
6. Format Data  
7. Reboot System  

⚠️ **Important:** Do NOT dirty flash any ROM on TWRP if you're encrypted.

---

### 🔓 Decrypted Devices
1. Flash latest firmware  
2. Flash **DerpFest ROM**  
3. Go to *Advanced > Install Recovery Ramdisk*  
4. Reboot to Recovery  
5. Flash DFE (DFE Neo or RO2RW)  
6. Flash GApps (if you flashed Vanilla ROM)  
7. Format Data (only on first use of DFE)  
8. If already decrypted: Wipe Cache, Dalvik, Metadata, Data  
9. Reboot System  

🔔 **Note:** You must format data if you're using DFE for the first time.
"

echo "✅ Git tag and GitHub release $GIT_TAG completed for $ROM_NAME"
