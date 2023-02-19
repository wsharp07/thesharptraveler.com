#!/bin/bash
# ./create-post.sh -t "title" -f "folder_name"

# Constants
ROOT_DIR=thesharptraveler.com
POST_PATH=content/en/blog/2023

# Set default values for title and folder
title=""
folder=""

# Process command line arguments
while getopts "t:f:" opt; do
  case $opt in
    t)
      title="$OPTARG"
      ;;
    f)
      folder="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

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
