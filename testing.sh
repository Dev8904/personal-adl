# Install Mercury
# Define the API URL
API_URL="https://api.github.com/repos/Alex313031/Mercury/releases/latest"

# Use curl to get the download URL of the latest .deb package
M_URL=$(curl -s "$API_URL" | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')

# Check, download, and install
if [ -n "$M_URL" ]; then
    wget -O /tmp/temp.deb "$M_URL"

    # Attempt to install the package
    if ! sudo dpkg -i /tmp/temp.deb; then
        echo "Attempting to fix broken dependencies..."
        sudo apt --fix-broken install

        # Retry the installation
        if ! sudo dpkg -i /tmp/temp.deb; then
            echo "Failed to find or install .deb package after fixing dependencies"
            exit 1
        fi
    fi

    echo "Package installed successfully."
    rm /tmp/temp.deb
else
    echo "Failed to find .deb package"
fi