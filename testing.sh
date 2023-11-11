# Install Mercury
# Define the API URL
API_URL="https://api.github.com/repos/Alex313031/Mercury/releases/latest"

# Use curl to get the download URL of the latest .deb package
M_URL=$(curl -s "$API_URL" | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')

# Check, download, and install
if [ -n "$M_URL" ]; then
    wget -O /tmp/temp.deb "$M_URL"
    sudo dpkg -i /tmp/temp.deb
    rm /tmp/temp.deb
else
    echo "Failed to find or install .deb package"
fi
