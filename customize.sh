SKIPUNZIP=0

if [ "$KSU" = "true" ]; then
  ui_print "- KernelSU detected (version: $KSU_VER_CODE)"
elif [ "$APATCH" = "true" ]; then
  ui_print "- APatch detected"
else
  ui_print "- Magisk detected"
fi

set_perm_recursive "$MODPATH" 0 0 0755 0644
