#!/bin/bash
cd $HOME
function rmv-dir-if-exist {
    local dir="$1"
    if [[ -d "$dir" ]]; then
        rm -rf "$dir"
    fi
}
# Remove existing ngrok binary and directory
rm "$PREFIX/bin/ngrok"
rmv-dir-if-exist "$PREFIX/share/ngrok"

# Create new directory structure for ngrok
mkdir -p "$PREFIX/share/ngrok"

# Copy get-ngrok.sh script to ngrok directory
curl -Ls https://raw.githubusercontent.com/qlxany/ngrok-on-termux/main/get.sh > ~/.get.sh
# Move .get.sh binary to specified directory
chmod +x .get.sh
cp .get.sh "$PREFIX/share/ngrok"


# Download ngrok binary
curl -Ls https://raw.githubusercontent.com/qlxany/ngrok-on-termux/main/ngrok > "$PREFIX/bin/ngrok"
# Move ngrok binary to specified directory
chmod +x "$PREFIX/bin/ngrok"

# Update and upgrade system packages
pkg update && pkg upgrade -y

# Install necessary packages
pkg install -y proot wget resolv-conf

# Clean up package manager cache
pkg clean

# Remove unnecessary packages
pkg autoclean

# Run get-ngrok.sh script
 ./.get.sh

# Display success message and instructions
mv .get.sh $PREFIX/bin/up-ng
echo -e "\e[1;32mNgrok installed successfully!\e[0m"
echo "Run: ngrok"
echo "To use ngrok"