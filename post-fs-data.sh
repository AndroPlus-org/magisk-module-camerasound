#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# Pixel JP SKU sets audio.camerasound.force=true from vendor init.rc.
# Override it before system_server (AudioService) starts.
# resetprop bypasses property_service SELinux checks (Magisk / KernelSU / APatch).
if command -v resetprop >/dev/null 2>&1; then
  resetprop -n audio.camerasound.force false
else
  setprop audio.camerasound.force false
fi
