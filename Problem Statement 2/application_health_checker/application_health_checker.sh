#!/bin/bash

# Define the application URL to check
APP_URL="https://www.amazon.in"  # Replace with your actual application URL

# Log file location
LOG_FILE="$HOME/application_health_checker.log"

# Get current date and time
timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Function to check application health
check_application_health() {
  # Send a request to the application URL and capture the HTTP status code
  HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $APP_URL)

  # Log the HTTP status code
  echo "$(timestamp): HTTP status code is $HTTP_STATUS" | tee -a $LOG_FILE

  # Determine if the application is up or down
  if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "$(timestamp): Application is UP." | tee -a $LOG_FILE
  else
    echo "$(timestamp): WARNING! Application is DOWN or experiencing issues." | tee -a $LOG_FILE
  fi
}

# Run the application health check
check_application_health
