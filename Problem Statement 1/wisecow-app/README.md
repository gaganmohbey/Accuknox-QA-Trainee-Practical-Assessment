# wisecow-app
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
- **GitHub Actions Workflow**: `.github/workflows/ci-cd.yaml`

## Workflow Steps
1. **Code Commit**: Changes are pushed to the `main` branch.
2. **Build Docker Image**: The Docker image is built using the Dockerfile.
3. **Push Docker Image**: The image is pushed to the GitHub Container Registry.
4. **Deploy to Kubernetes**: The application is deployed using the Kubernetes manifest files.
5. **Verify Deployment**: Ensure the application is running and accessible.
