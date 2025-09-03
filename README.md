# DevSecOps Pipeline Demo

This repository demonstrates a complete DevSecOps pipeline for a Flask web application. The pipeline is built using GitHub Actions and includes the following security scanning tools:

- **Semgrep** for static application security testing (SAST)
- **OWASP Dependency-Check** for scanning third-party dependencies
- **Trivy** for scanning the Docker image for vulnerabilities

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation and Setup](#installation-and-setup)
- [CI/CD Pipeline](#cicd-pipeline)
- [Contributing](#contributing)

---

## Project Overview

This project builds a simple Flask web application that is containerized with Docker. The GitHub Actions pipeline automatically:

- Installs dependencies
- Runs static code analysis with Semgrep
- Scans project dependencies using OWASP Dependency-Check
- Builds a Docker image
- Scans the Docker image for vulnerabilities using Trivy

---

## Features

- **Flask Web App:** A basic app that returns a string message.
- **Docker Container:** Containerized using a secure Dockerfile with a non-root user.
- **Security Scanning:** Integration with Semgrep, Dependency-Check, and Trivy to ensure code and container are secure.
- **CI/CD Pipeline:** Automated build and scan process using GitHub Actions.

---

## Project Structure

devsecops-pipeline-demo/
├── app/
│ └── app.py # Flask demo app
├── requirements.txt # Python dependencies
├── Dockerfile # Container build
├── README.md # Documentation
├── .github/workflows/security.yml # GitHub Actions pipeline
├── semgrep.yml # Custom Semgrep rules
├── .semgrepignore # Ignore paths for Semgrep
└── .trivyignore # Ignore list for Trivy

---

## Prerequisites

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/)
- [Python 3.9+](https://www.python.org/)

---

## Installation and Setup

1. Clone the repository:
   ```
   git clone https://github.com/<your-username>/devsecops-pipeline-demo.git
   cd devsecops-pipeline-demo
   ```

2. Install dependencies locally:
   ```
   python3 -m venv venv
   source venv/bin/activate
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

3. Run the application locally:
   ```
   python app/app.py
   ```

Visit http://localhost:5000

4. Build and run with Docker:
   ```
   docker build -t devsecops-demo .
   docker run -p 5000:5000 devsecops-demo
   ```

## CI/CD Pipeline

The GitHub Actions pipeline (.github/workflows/security.yml) performs the following:

   1. Checkout code and install dependencies
   
   2. Run Semgrep for static code analysis

      - Blocks PRs only on new high-severity issues

      - Runs in report-only mode on main

   3. Run OWASP Dependency-Check to scan third-party dependencies

      - Blocks PRs on CVEs with CVSS ≥ 8

      - Uploads SARIF + HTML report

   4. Build the Docker image using Docker Buildx

   5. Run Trivy to scan the Docker image for vulnerabilities

      - Blocks PRs on new HIGH/CRITICAL vulnerabilities

      - Ignores “unfixed” CVEs for actionability

   6. Uploads all SARIF reports to the GitHub Security tab for visibility