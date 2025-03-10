# DevSecOps Pipeline Demo

This repository demonstrates a complete DevSecOps pipeline for a Flask web application. The pipeline is built using GitHub Actions and includes the following security scanning tools:

- **Semgrep** for static application security testing (SAST)
- **OWASP Dependency-Check** for scanning third-party dependencies
- **Trivy** for scanning the Docker image for vulnerabilities

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation and Setup](#installation-and-setup)
- [CI/CD Pipeline](#cicd-pipeline)
- [Contributing](#contributing)

## Project Overview

This project builds a simple Flask web application that is containerized with Docker. The GitHub Actions pipeline automatically:
- Installs dependencies.
- Runs static code analysis with Semgrep.
- Scans project dependencies using OWASP Dependency-Check.
- Builds a Docker image.
- Scans the Docker image for vulnerabilities using Trivy.

## Features

- **Flask Web App:** A basic application that returns a JSON message.
- **Docker Container:** The application is containerized using a secure Dockerfile that runs as a non-root user.
- **Security Scanning:** Integration with Semgrep, Dependency-Check, and Trivy to ensure the code and container are secure.
- **CI/CD Pipeline:** Automated build and scan process using GitHub Actions.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:
- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
- [Python 3.9+](https://www.python.org/)

For GitHub Actions, your repository will use the default Ubuntu runner, so no extra setup is required for the CI/CD pipeline.

## Installation and Setup

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/<your-username>/devsecops-pipeline-demo.git
   cd devsecops-pipeline-demo

2. **Install Python Dependencoes**

Create a Virtual Environment (recommended):

   python3 -m venv venv
   source venv/bin/activate
   pip install --upgrade pip
   pip install -r requirements.txt

3. Docker Setup
   
   Ensure Docker is installed and running on your system correctly. Test with:

   docker --version

4. Running the Application Locally

With the virtual environment activated, start the app:
   Using python app/app.py
   To Access the app, open your browser and navigate to http://localhost:5000 or http://<your ip addr>:5000 to see the JSON response

## CI/CD Pipeline

The GitHub Actions pipeline (.github/workflows/security.yml) performs the following:

  1. Checkout code and install dependencies.
  2. Run Semgrep for static code analysis.
  3. Install and run OWASP Dependency-Check to scan for vulnerable dependencies.
  4. Build the Docker image using Docker Buildx.
  5. Install and run Trivy to scan the Docker image for vulnerabilities.

## Contributing

  Contributions are welcome! Please fork this repository and create a pull request for any improvements.



