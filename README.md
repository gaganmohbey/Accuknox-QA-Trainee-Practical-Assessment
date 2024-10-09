# Problem Statement 1 : Accuknox QA Trainee Practical Assessment/Problem Statement 1/wisecow-app
Objective: To containerize and deploy the Wisecow application, hosted in the above-mentioned GitHub repository, on a Kubernetes environment with secure TLS communication.

End Goal: The successful containerisation and deployment of the Wisecow
application to the Kubernetes environment with an automated CI/CD pipeline and
secured with TLS communication.

# CI/CD Pipeline Configuration for Wisecow Application

## Overview
This document outlines the CI/CD pipeline configuration for deploying the Wisecow application using GitHub Actions.

## Components
- **Source Code**: [GitHub Repository](https://github.com/nyrahul/wisecow)
- **Dockerfile**: Located in the `Problem Statement 1/wisecow-app/` directory.
- **Kubernetes Configuration Files**:
  - `wisecow-deployment.yaml`
  - `wisecow-service.yaml`
  - `wisecow-ingress.yaml`
- **GitHub Actions Workflow**: `.github/workflows/ci-cd-for-wisecow-app.yaml`

## Workflow Steps
1. **Code Commit**: Changes are pushed to the `main` branch.
2. **Build Docker Image**: The Docker image is built using the Dockerfile.
3. **Push Docker Image**: The image is pushed to the GitHub Container Registry.
4. **Deploy to Kubernetes**: The application is deployed using the Kubernetes manifest files.
5. **Verify Deployment**: Ensure the application is running and accessible.

# Problem Statement 2: Accuknox QA Trainee Practical Assessment/Problem Statement 2/system_health_monitor.sh, and application_health_checker.sh

Health Monitoring Scripts

This directory contains two Bash scripts designed for health monitoring of a Linux system and an application. 

## Scripts Overview

1. **System Health Monitoring Script**: Monitors CPU usage, memory usage, disk space, and running processes. Alerts are generated if any metrics exceed predefined thresholds.
4. **Application Health Checker**: Checks the uptime and functionality of an application by verifying HTTP status codes, determining whether the application is 'up' (functioning correctly) or 'down' (unavailable).

## 1. System Health Monitoring Script: `system_health_monitor.sh`


### Features:
- Checks CPU usage
- Checks memory usage
- Checks disk space
- Monitors running processes
- Alerts to console or log file if thresholds are exceeded

### Pre-requisites:
- Ensure you have permissions to execute the script.
- Bash shell should be available on the system.

### Command to Run:
```bash
bash system_health_monitor.sh

bash application_health_checker.sh <application_url>
```

# Application Health Checker

The `application_health_checker.sh` script is a Bash script designed to check the uptime and functionality of an application by verifying its HTTP status codes. It provides a simple way to monitor if an application is functioning correctly or is unavailable.

## Features

- **Uptime Check**: Monitors the uptime of the application by periodically checking the URL.
- **HTTP Status Code Verification**: Verifies the HTTP status codes returned by the application to determine its health.
- **Health Status Reporting**:
  - **'Up'**: If the application is functioning correctly (HTTP status code 200).
  - **'Down'**: If the application is unavailable or not responding (HTTP status code other than 200).
- **Customizable URL Input**: Allows users to specify the URL of the application they want to monitor.
- **Output Display**: Provides clear output to the console regarding the application's current health status.

## Pre-requisites

- The application must be accessible via a valid URL.
- Ensure that you have execution permissions for the script.
- Bash shell should be available on the system.

## How to Use

### Step 1: Download or Clone the Script
First, download or clone the repository to access the `application_health_checker.sh` script.

```bash
git clone <repository-url>

 


### Notes:
- This version of the `README.md` now includes pre and post execution details specifically for the **Application Health Checker** script, giving users clear guidance on what to expect before and after running the script.


