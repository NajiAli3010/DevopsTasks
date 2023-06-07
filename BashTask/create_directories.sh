#!/bin/bash

# Prompt the user to enter the root directory path
read -p "Enter the root directory path: " root_directory

# Get the list of users
user_list=$(wmic useraccount where "disabled='FALSE'" get name | grep -v '^$' | tail -n +2)

# Create the directory for each user
for user in ${user_list}; do
    user_directory="${root_directory}/${user}"
    
    # Create the directory
    mkdir -p "${user_directory}"
    
    # Set permissions to 755
    chmod 755 "${user_directory}"
    
    # Set the owner as the corresponding user
    chown "${user}" "${user_directory}"
    
    # Log the creation of the directory
    echo "Created directory ${user_directory}"
    echo "Created directory ${user_directory}" >> create_directory.log
done
