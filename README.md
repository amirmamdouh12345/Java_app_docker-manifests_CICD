 

# **Java App with Docker, Kubernetes, and CI/CD Pipeline**  
 **Automated CI/CD pipeline for a Java (Gradle) app deployed on Kubernetes (Minikube) using Jenkins, ArgoCD, and Ansible.**  

## ** Project Overview**  
This project demonstrates a **full CI/CD pipeline** for a Java web application:  
- **Build & Test**: Gradle-based Java app with unit tests.  
- **Containerization**: Dockerized and pushed to DockerHub.  
- **Orchestration**: Kubernetes (Minikube) deployment using manifests.  
- **GitOps**: ArgoCD auto-syncs Kubernetes deployments from Git.  
- **Infrastructure Automation**: Ansible roles for Jenkins, Docker, Java, and Gradle setup.  

---

## ** Technologies Used**  
| **Category**       | **Tools**                                                                 |
|--------------------|--------------------------------------------------------------------------|
| **CI/CD**          | Jenkins, GitHub Actions (optional)                                       |
| **Containerization** | Docker, DockerHub                                                       |
| **Orchestration**  | Kubernetes (Minikube), ArgoCD (GitOps)                                  |
| **Infrastructure** | Ansible (for provisioning Jenkins, Docker, Java, Gradle)                |
| **App Framework**  | Java (Spring Boot), Gradle                                              |

---
![](https://github.com/amirmamdouh12345/Java_app_docker-manifests_CICD/blob/master/proj-structure.jpeg)
---

## ** Repository Structure**  
```bash
.
├── ansible/                  # Ansible roles for Jenkins, Docker, Java, etc.
├── docker/                   # Dockerfile for containerizing the Java app
├── manifests/                # Kubernetes YAMLs (Deployment, Service, Ingress)
├── web-app/                  # Java (Gradle) source code
├── Jenkinsfile               # Jenkins pipeline definition
├── README.md                 # This documentation
└── ...                       # Other configs/scripts
```

---

## ** Pipeline Workflow**  
### **1. Jenkins CI/CD Pipeline**  
The Jenkins pipeline (`Jenkinsfile`) runs these stages:  
1. **Git Clone**: Pulls the Java app from GitHub.  
2. **Test & Build**: Runs Gradle tests and builds the JAR.  
3. **Docker Build & Push**:  
   - Builds a Docker image.  
   - Pushes to DockerHub (credentials secured in Jenkins).  
4. **GitOps Sync with ArgoCD**:  
   - Updates Kubernetes manifests in a Git repo.  
   - ArgoCD auto-deploys changes to Kubernetes (Minikube).  

### **2. ArgoCD (GitOps)**  
- ArgoCD monitors the **manifests Git repo**.  
- When Jenkins updates manifests, ArgoCD **auto-syncs** to Kubernetes.  

---

## ** Setup Guide**  
### **Prerequisites**  
- Minikube (local Kubernetes)  
- Jenkins (with Docker, Git, and Ansible plugins)  
- ArgoCD installed on Kubernetes  
- DockerHub account  

### **Steps to Deploy**  
1. **Provision Infrastructure with Ansible**  
   ```bash
   ansible-playbook -i inventory.ini ansible_playbook.yml
   ```
2. **Run Jenkins Pipeline**  
   - The `Jenkinsfile` handles:  
     - Building the app.  
     - Pushing Docker images.  
     - Updating ArgoCD’s Git repo.  

3. **ArgoCD Auto-Deploys**  
   - ArgoCD detects Git changes → deploys to Minikube.
   - GitOps-style deployment with ArgoCD handling Kubernetes manifests  ->  Repo: Java_app_docker-manifests_CICD_argoCD

---

## ** Key Features**  
 **End-to-End Automation** – From code commit to Kubernetes deployment.  
 **GitOps Approach** – Kubernetes state managed via Git (ArgoCD).  
 **Infrastructure as Code (IaC)** – Ansible automates tool installations.  
 **Secure Credentials** – DockerHub and GitHub tokens stored in Jenkins.  

