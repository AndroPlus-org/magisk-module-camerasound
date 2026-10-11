#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

set_prop() {
  if command -v resetprop >/dev/null 2>&1; then
    resetprop audio.camerasound.force false
  else
    setprop audio.camerasound.force false
  fi
}

set_prop

# Re-apply after boot in case vendor init sets it again later
(
  until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
  done
  [ "$(getprop audio.camerasound.force)" = "false" ] || set_prop
) &
