#!/bin/bash

# Function to install a package from a given API URL
install_git_package() {
    local API_URL=$1

    # Get the download URL of the latest .deb package
    M_URL=$(curl -s "$API_URL" | jq -r '.assets[] | select(.name | endswith(".deb")) | .browser_download_url')

    # Check, download, and install
    if [ -n "$M_URL" ]; then
        wget -O /tmp/temp.deb "$M_URL"

        # Attempt to install the package
        if ! sudo dpkg -i /tmp/temp.deb; then
            echo "Attempting to fix broken dependencies..."
            sudo apt-get -y --fix-broken install

            # Retry the installation
            if ! sudo dpkg -i /tmp/temp.deb; then
                echo "Failed to find or install .deb package after fixing dependencies"
                return 1
            fi
        fi

        echo "Package installed successfully."
        rm /tmp/temp.deb
    else
        echo "Failed to find .deb package"
    fi
}

# Array of API URLs
api_urls=(
    "https://api.github.com/repos/Alex313031/thorium/releases/latest"
    "https://api.github.com/repos/Alex313031/Mercury/releases/latest"
    "https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest"
    # Add more URLs as needed
)

# Loop over the array and call the install_git_package function
for url in "${api_urls[@]}"; do
    install_git_package "$url"
done
