#!/bin/bash

REPO_URL="https://github.com/BlockOp/client-bundle"
LOCAL_DIR="/home/ubuntu/client"
SCRIPT_NAME="install-update.sh"
CRON_LOG="/home/ubuntu/update-client.log"
CRON_JOB="0 * * * * $LOCAL_DIR/$SCRIPT_NAME > $CRON_LOG 2>&1"

# Clone or update the repository
if [ ! -d "$LOCAL_DIR" ]; then
  git clone "$REPO_URL" "$LOCAL_DIR"
else
  cd "$LOCAL_DIR"
  git fetch

  # Check if there's an update to the script itself
  if [ -n "$(git diff HEAD..origin/main --name-only | grep $SCRIPT_NAME)" ]; then
    git pull
    echo "The script has been updated. Please run it again to continue."
    exit 0
  fi

  git pull
fi

cd "$LOCAL_DIR"

# Add the cron job if it doesn't exist
if ! (crontab -l | grep -q "$SCRIPT_NAME"); then
  (crontab -l; echo "$CRON_JOB") | crontab -
  echo "Cron job for automatic updates has been added."
fi

# Start or update the application
docker-compose up -d
