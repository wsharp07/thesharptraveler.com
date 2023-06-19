#!/bin/bash
# ./create-post.sh -t "title" -f "folder_name"

# Constants
ROOT_DIR=thesharptraveler.com
POST_PATH=content/en/blog/2023

# Set default values for title and folder
title=""
folder=""

# Function to display the help message
display_help() {
    echo "Usage: create:post [-f|--folder FOLDER] [-t|--title TITLE]"
    echo "Options:"
    echo "  -f, --folder FOLDER    Specify the folder"
    echo "  -t, --title TITLE      Specify the title"
    echo "  -h, --help             Display this help message"
}


# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--folder)
            folder="$2"
            shift 2
            ;;
        -t|--title)
            title="$2"
            shift 2
            ;;
        -h|--help)
            display_help
            exit 0
            ;;
        *)
            echo "Invalid argument: $1"
            display_help
            exit 1
            ;;
    esac
done

# Check if the title argument is provided
if [ -z "$title" ]; then
    echo "Error: The title argument is required."
    display_help
    exit 1
fi

# Get the current ISO date
today=$(date +%Y%m%d)

# Santize the title
lower_case_string="$(echo "$title" | tr '[:upper:]' '[:lower:]')"
no_space_string=${lower_case_string// /-}

# Set the folder name
FOLDER_NAME="$today-$no_space_string"

FOLDER_PATH=$ROOT_DIR/$POST_PATH/$FOLDER_NAME
CURRENT_DATE=$(date +'%Y-%m-%d')

# Create new post folder
mkdir -p $FOLDER_PATH

# Create new post
echo "---
author: \"William Sharp\"
title: \"$title\"
date: $CURRENT_DATE
description: \"This is a sample description\"
tags: [\"tag1\", \"tag2\"]
thumbnail: https://picsum.photos/id/1050/400/250
draft: true
---" > $FOLDER_PATH/index.md
