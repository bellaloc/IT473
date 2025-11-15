CloudEats Direct

CloudEats Direct is a microservices-based food delivery platform. This project contains multiple services (fleet, inventory, notification, order, and payment), infrastructure code using Terraform, and CI/CD pipelines for automated testing and deployment.

Table of Contents

Project Structure

Requirements

Installation
( for service in services/*; do
  cd $service
  npm install
  cd ../..
done
_ )

IT473 folder: for service in services/*/; do (cd "$service" && npm install); done

npm install -g concurrently

concurrently "npm start --prefix services/fleet-service" \
            "npm start --prefix services/inventory-service" \
            "npm start --prefix services/notification-service" \
            "npm start --prefix services/order-service" \
            "npm start --prefix services/payment-service"

            or:

chmod +x start-all.sh

./start-all.sh


Running the Project

Services

Infrastructure

CI/CD

Documentation

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

Node.js
 v18+

Docker
 and Docker Compose v2+

Terraform
 (for infrastructure)

Installation

Clone the repository:

git clone <repo-url>
cd cloudeats-direct


Install dependencies for all services:

cd services/fleet-service && npm install
cd ../inventory-service && npm install
cd ../notification-service && npm install
cd ../order-service && npm install
cd ../payment-service && npm install


Tip: You can automate this with a shell script for all services.

Running the Project
Using Docker Compose

From the project root:

docker compose up --build


This will start all microservices locally and connect them via Docker networking.

Access Services

Fleet Service: http://localhost:3001

Inventory Service: http://localhost:3002

Notification Service: http://localhost:3003

Order Service: http://localhost:3004

Payment Service: http://localhost:3005

Ports are defined in each service’s Dockerfile or docker-compose.yml.

Services

Each service has:

src/index.js → entry point

package.json → dependencies

Dockerfile → Docker build instructions

README.md → service-specific documentation

Infrastructure

Infrastructure is managed via Terraform under infrastructure/:

Compute: ECS, Lambda, API Gateway

Database: Aurora, Neptune, Redis

Network: VPC, Subnets, Route53

Storage: S3

Security: IAM, KMS, WAF, Secrets Manager

Monitoring: CloudWatch, X-Ray, Logs

Initialize and apply Terraform:

cd infrastructure
terraform init
terraform apply

CI/CD

CI/CD is set up using GitHub Actions (ci-cd/github-actions/build-and-deploy.yml) with scripts under ci-cd/scripts/:

build.sh → builds Docker images

test.sh → runs automated tests

deploy.sh → deploys to staging/production

Trigger workflow on push or pull requests to main branch.

Documentation

Documentation is located in docs/:

api-spec.yaml → OpenAPI spec

architecture-diagram.png → system architecture

team-roles.md → roles and responsibilities

Notes

Ensure Docker is running before executing Docker Compose commands.

Each service can also be run locally using npm start after installing dependencies.

Use docker compose down to stop the environment.