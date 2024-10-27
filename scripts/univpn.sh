#!/usr/bin/env bash

# Define the config file path
CONFIG_FILE=~/.server_config

# Check if the config file exists; if not, prompt the user for the SSH address
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Please enter the SSH address (e.g., user@hostname:~/path):"
    read -r ssh_address
    echo "SSH_ADDRESS=$ssh_address" > "$CONFIG_FILE"
    echo "SSH address saved to $CONFIG_FILE"
fi

# Source the SSH address from the config file
source "$CONFIG_FILE"

# Extract the IP segment from the SSH address
ip_segment=$(echo "$SSH_ADDRESS" | sed 's/^.*@//; s/:.*$//')

# Main script logic
if [ -d ~/server/bin ]; then 
    umount ~/server/
    notify-send "Server folder unmounted"
    echo "$SSH_ADDRESS folders unmounted from ~/server/"
fi

if ip addr show | grep -q "$ip_segment"; then
    pid=($(pgrep -f "sudo openconnect*"))
    sudo kill "${pid[0]}"
    notify-send "Uni graz vpn disconnected"
else
    echo "Sudo password:"
    read -s password
    echo "$password" | sudo -S echo 
    nohup openconnect-sso > /dev/null 2>&1 &

    # Check VPN connection loop
    while true; do
        if ip addr show | grep -q "$ip_segment"; then
            notify-send "Uni graz vpn connected"
            break
        else
            sleep 2
        fi
    done

    # Option to mount server folder
    if gum confirm "Would you like to mount the server to ~/server/ ?"; then
        sshfs "$SSH_ADDRESS" ~/server/
        while true; do 
            if [ -d ~/server/bin ]; then
                notify-send "Server mounted"
                break
            else
                sleep 2
            fi
        done
    else
        echo "Not mounting"
    fi
fi
