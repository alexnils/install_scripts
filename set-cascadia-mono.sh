#!/bin/bash

CONFIG_DIR="$HOME/.config/fontconfig/conf.d"
CONFIG_FILE="$CONFIG_DIR/10-cascadia-mono.conf"

mkdir -p "$CONFIG_DIR"

cat > "$CONFIG_FILE" <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <!-- Force monospace to use Cascadia Mono -->
  <match target="pattern">
    <test name="family" compare="eq">
      <string>monospace</string>
    </test>
    <edit name="family" mode="prepend" binding="strong">
      <string>Cascadia Mono</string>
    </edit>
  </match>
</fontconfig>
EOF

echo "Wrote fontconfig override to: $CONFIG_FILE"
echo "Rebuilding font cache..."
fc-cache -fv

echo "Current monospace match:"
fc-match monospace
