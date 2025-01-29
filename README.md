DevOps CI/CD Pipeline for Docker and EC2 Deployment
This project is a React-based frontend containerized with Docker, image pushed to dockerhub and deployed to AWS EC2 via a GitHub Actions CI/CD pipeline.

CI/CD Pipeline Workflow
Checkout Code – Pulls the latest code from GitHub.
Set Up Docker Buildx – Enables advanced Docker build features.
Log In to Docker Hub – Authenticates using GitHub Secrets.
Build and Push Docker Image – Builds the React app and pushes it to Docker Hub.
Check EC2 Status (Terraform) – Verifies if the EC2 instance is running.
Provision EC2 (If Needed) – Uses Terraform to create an EC2 instance if not running.
Deploy to EC2 via SSH – Pulls the latest image, stops the old container, and runs the new one.

graph TD;
    A[Code Push to GitHub] --> B[Checkout Code]
    B --> C[Setup Docker Buildx]
    C --> D[Login to Docker Hub]
    D --> E[Build Docker Image]
    E --> F[Push Docker Image]
    F --> G[Check EC2 Status via Terraform]
    G --> H{EC2 Running?}
    H -- No --> I[Provision EC2 with Terraform]
    H -- Yes --> J[SSH into EC2]
    J --> K[Pull Docker Image]
    K --> L[Stop and Remove Old Container]
    L --> M[Run New Container]
    M --> N[Deployment Complete]
