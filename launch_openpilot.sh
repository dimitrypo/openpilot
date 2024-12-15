#!/usr/bin/bash
export API_HOST=https://api.springerelectronics.com
export ATHENA_HOST=wss://athena.springerelectronics.com
export DISABLE_SCREEN_RECORDER=1
export DISPLAY=host.docker.internal:0
export QT_QPA_PLATFORM=xcb
export XDG_RUNTIME_DIR=/tmp/runtime-batman
export QT_X11_NO_MITSHM=1
export QT_QUICK_BACKEND=software
export LIBGL_ALWAYS_SOFTWARE=1  # Force software rendering
export GALLIUM_DRIVER=llvmpipe  # Use LLVM software renderer
# Create required directories for development
sudo mkdir -p /data/backups /persist/params /persist/tracking /data/models /data/themes /usr/comma
sudo chmod -R 777 /data /persist /usr/comma

# Create symlinks for assets
mkdir -p /data/openpilot
ln -sf /workspaces/openpilot/selfdrive /data/openpilot/selfdrive

# Ensure proper file permissions
chmod 644 /workspaces/openpilot/selfdrive/ui/qt/offroad/text_view.qml
chmod 644 /workspaces/openpilot/selfdrive/assets/offroad/tc.html
mkdir -p /workspaces/openpilot/selfdrive/ui/qt/helpers

exec ./launch_chffrplus.sh
