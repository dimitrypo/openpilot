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
exec ./launch_chffrplus.sh
