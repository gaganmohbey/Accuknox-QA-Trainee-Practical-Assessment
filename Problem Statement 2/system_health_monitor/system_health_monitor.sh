#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80  # Percentage
MEMORY_THRESHOLD=80  # Percentage
DISK_THRESHOLD=80  # Percentage
LOG_FILE="/var/log/system_health_monitor.log"

# Get current date and time
timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Log to console and file
log_message() {
  local message="$1"
  echo "$(timestamp): $message"  # Print to console
  echo "$(timestamp): $message" >> $LOG_FILE  # Append to log file
}

# Function to check CPU usage
check_cpu_usage() {
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  log_message "CPU usage is at ${CPU_USAGE}%"

  if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    log_message "WARNING! CPU usage is above ${CPU_THRESHOLD}% at ${CPU_USAGE}%"
  fi
}

# Function to check memory usage
check_memory_usage() {
  MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  log_message "Memory usage is at ${MEMORY_USAGE}%"

  if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    log_message "WARNING! Memory usage is above ${MEMORY_THRESHOLD}% at ${MEMORY_USAGE}%"
  fi
}

# Function to check disk space usage
check_disk_usage() {
  DISK_USAGE=$(df -h / | grep '/' | awk '{print $5}' | sed 's/%//g')
  log_message "Disk usage is at ${DISK_USAGE}%"

  if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    log_message "WARNING! Disk usage is above ${DISK_THRESHOLD}% at ${DISK_USAGE}%"
  fi
}

# Function to check the number of running processes
check_running_processes() {
  PROCESS_COUNT=$(ps aux | wc -l)
  log_message "Number of running processes: ${PROCESS_COUNT}"
}

# Execute all monitoring checks
check_cpu_usage
check_memory_usage
check_disk_usage
check_running_processes
