#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <admin|user>"
    exit 1
fi

USERNAME=$1
ROLE=$2

if id "$USERNAME" &>/dev/null; then
    case $ROLE in
    admin)
        dseditgroup -o edit -a "$USERNAME" -t user admin
        if [ $? -eq 0 ]; then
            echo "User $USERNAME has been added to the admin group."
        else
            echo "Failed to add $USERNAME to the admin group."
        fi
        ;;
    user)
        dseditgroup -o edit -d "$USERNAME" -t user admin
        if [ $? -eq 0 ]; then
            echo "User $USERNAME has been removed from the admin group."
        else
            echo "Failed to remove $USERNAME from the admin group."
        fi
        ;;
    *)
        echo "Invalid role: $ROLE. Use 'admin' or 'user'."
        exit 1
        ;;
    esac
else
    echo "User $USERNAME does not exist."
    exit 1
fi
