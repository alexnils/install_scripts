#!/bin/bash

# This script configures locales and language settings for your system (including GNOME) via the terminal.

# Step 1: Uncomment English and Swedish locales in /etc/locale.gen (only if commented out)
echo "Uncommenting English and Swedish locales in /etc/locale.gen if they are commented out..."

# Uncomment en_US.UTF-8 if it's commented
if grep -q "^#.*en_US.UTF-8" /etc/locale.gen; then
    sudo sed -i 's/^#\s*\(en_US.UTF-8\)/\1/' /etc/locale.gen
    echo "Uncommented en_US.UTF-8"
else
    echo "en_US.UTF-8 is already uncommented."
fi

# Uncomment sv_SE.UTF-8 if it's commented
if grep -q "^#.*sv_SE.UTF-8" /etc/locale.gen; then
    sudo sed -i 's/^#\s*\(sv_SE.UTF-8\)/\1/' /etc/locale.gen
    echo "Uncommented sv_SE.UTF-8"
else
    echo "sv_SE.UTF-8 is already uncommented."
fi

# Step 2: Generate the locales
echo "Generating locales..."
sudo locale-gen

# Step 3: Check available locales
echo "Checking available locales..."
localectl list-locales

# Step 4: Configure the locale settings
echo "Setting up locale.conf..."
mkdir -p ~/.config  # Ensure the .config directory exists
cat <<EOF | sudo tee ~/.config/locale.conf > /dev/null
LANG=en_US.UTF-8
LC_TIME=sv_SE.UTF-8
LC_MEASUREMENT=sv_SE.UTF-8
LC_MONETARY=sv_SE.UTF-8
EOF

# Step 5: Apply locale settings
echo "Applying new locale settings..."
unset LANG
source /etc/profile.d/locale.sh

# Step 6: Change GNOME format settings to Swedish via terminal
echo "Changing GNOME formats to Swedish..."

# Set the region and language formats to Swedish in GNOME
gsettings set org.gnome.system.locale region 'se_SE.UTF-8'
gsettings set org.gnome.desktop.interface clock-format '24h'

# Step 7: Final instructions
echo "Locale setup complete!"
echo "For GNOME: The formats are now set to Swedish."
echo "You have to log in and out of the session for them to take affect."

# End of script
