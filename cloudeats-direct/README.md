CloudEats Direct

CloudEats Direct is a microservices-based food delivery platform built with modern technologies. This project contains multiple services (fleet, inventory, notification, order, and payment), infrastructure code using Terraform, and CI/CD pipelines for automated testing and deployment.

Table of Contents

Project Structure

Requirements

Installation

Running the Project

Services

Infrastructure

CI/CD

Documentation

Notes

Project Structure
cloudeats-direct/
├─ services/
│  ├─ fleet-service/
│  ├─ inventory-service/
│  ├─ notification-service/
│  ├─ order-service/
│  └─ payment-service/
├─ infrastructure/
│  ├─ compute/
│  ├─ database/
│  ├─ network/
│  ├─ storage/
│  ├─ security/
│  └─ monitoring/
├─ ci-cd/
│  ├─ github-actions/
│  └─ scripts/
├─ docs/
├─ docker-compose.yml
└─ README.md

Requirements

Node.js v18+

Docker and Docker Compose v2+

Terraform (for infrastructure setup)

Installation
1. Clone the Repository
git clone <repo-url>
cd cloudeats-direct

2. Install Dependencies for All Services

You can either install dependencies for each service manually or automate it with a script.

Manual Installation:

For each service, run:

cd services/fleet-service && npm install
cd ../inventory-service && npm install
cd ../notification-service && npm install
cd ../order-service && npm install
cd ../payment-service && npm install

Automate with a Script:

Run the following command to install dependencies for all services in one go:

for service in services/*; do
  cd $service
  npm install
  cd ../..
done


Alternatively, you can use a start-all.sh script (see Running the Project section for more details).

3. Install Concurrently

To run services concurrently (optional but recommended):

npm install -g concurrently

Running the Project
Option 1: Using Docker Compose

To start all services using Docker Compose, run the following command from the project root:

docker compose up --build


This will build and start all microservices locally and connect them via Docker networking.

Option 2: Manually Using start-all.sh

Make the script executable:

chmod +x start-all.sh


Run the script:

./start-all.sh


This will start all services concurrently.

Access Services

Once the services are up and running, you can access them via the following URLs:

Fleet Service: http://localhost:3001

Inventory Service: http://localhost:3002

Notification Service: http://localhost:3003

Order Service: http://localhost:3004

Payment Service: http://localhost:3005

Ports are defined in each service's Dockerfile or docker-compose.yml.

Services

Each service includes the following:

src/index.js → Entry point

package.json → Service dependencies

Dockerfile → Docker build instructions

README.md → Service-specific documentation

Infrastructure

Infrastructure is managed via Terraform under the infrastructure/ directory:

Compute: ECS, Lambda, API Gateway

Database: Aurora, Neptune, Redis

Network: VPC, Subnets, Route53

Storage: S3

Security: IAM, KMS, WAF, Secrets Manager

Monitoring: CloudWatch, X-Ray, Logs

1. Initialize Terraform:
cd infrastructure
terraform init

2. Apply Terraform:
terraform apply


This will deploy the infrastructure.

CI/CD

CI/CD pipelines are set up using GitHub Actions. The workflow is defined in ci-cd/github-actions/build-and-deploy.yml and includes the following scripts located under ci-cd/scripts/:

build.sh → Builds Docker images for the services

test.sh → Runs automated tests

deploy.sh → Deploys to staging/production

The GitHub Actions workflow triggers on pushes or pull requests to the main branch.

Documentation

Documentation for the project can be found in the docs/ directory, including:

api-spec.yaml → OpenAPI specification for the API

architecture-diagram.png → High-level system architecture

team-roles.md → Team roles and responsibilities

Notes

Ensure Docker is running before executing Docker Compose commands.

Each service can also be run locally using npm start after installing dependencies.

To stop the services and bring down the Docker environment:

docker compose down