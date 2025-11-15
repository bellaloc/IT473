CloudEats Direct – Cloud-Based Logistics & E-Commerce Platform
Project Overview

CloudEats Direct is a cloud-native logistics and e-commerce platform designed to provide:

Customer-facing order placement, tracking, and notifications

Real-time fleet telemetry and routing

Integration with ERP, WMS, and TMS systems

High availability, multi-region deployment on AWS

Event-driven microservices architecture for scalability and resilience

The system uses AWS-managed services including ECS, Lambda, Aurora Global DB, Neptune, S3, CloudFront, EventBridge, and IoT Core.

Architecture

The architecture is organized into five primary planes:

Edge & Delivery Plane – Global routing, security, CDN, and caching.

Application Plane – Stateless microservices for Orders, Inventory, Fleet, Payment, Notification.

Data Plane – Transactional (Aurora), Graph (Neptune), Cache (ElastiCache), Analytics (S3/Glue/Redshift/QuickSight).

Integration Plane – Event-driven messaging with EventBridge, SQS, SNS, Step Functions, and IoT telemetry.

Security & Operations Plane – IAM, KMS, Secrets Manager, CloudWatch, X-Ray, Config, GuardDuty, and CI/CD automation.

Multi-Region Design:

Active–Active deployment in US-East-1 and US-West-2

Aurora Global DB and Neptune Global DB for cross-region replication

S3 Cross-Region Replication (CRR)

Route 53 health checks and AWS Global Accelerator for failover

Project Structure
cloudeats-direct/
│
├─ services/
│   ├─ order-service/
│   │   └─ src/
│   │       ├─ index.js
│   │       ├─ routes.js
│   │       └─ db.js
│   ├─ inventory-service/
│   ├─ fleet-service/
│   ├─ payment-service/
│   └─ notification-service/
│
├─ infrastructure/
│   ├─ network/
│   │   ├─ main.tf
│   │   ├─ variables.tf
│   │   └─ outputs.tf
│   ├─ compute/
│   ├─ database/
│   └─ storage/
│
├─ ci-cd/
│   ├─ github-actions/
│   │   └─ build-and-deploy.yml
│   └─ scripts/
│       ├─ build.sh
│       ├─ deploy.sh
│       └─ test.sh
│
└─ docs/
    ├─ architecture-diagram.png
    ├─ api-spec.yaml
    └─ team-roles.md

Setup & Installation
Prerequisites

Node.js v18+

AWS CLI configured

Terraform v1.5+

Git

Clone Repository
git clone https://github.com/bellaloc/cloudeats-direct.git
cd cloudeats-direct

Infrastructure
cd infrastructure/network
terraform init
terraform plan
terraform apply


Repeat for other infrastructure modules (compute, database, storage).

Microservices
cd services/order-service
npm install
npm start


Repeat for inventory-service, fleet-service, payment-service, notification-service, changing the port as needed.

CI/CD

Configure GitHub Actions using ci-cd/github-actions/build-and-deploy.yml

Use provided scripts in ci-cd/scripts/ to build, test, and deploy

Usage

Access API via http://localhost:3001/orders (for Order Service)

Use Postman or similar tool to test endpoints

Real-time fleet telemetry simulated via fleet-service MQTT or API

Performance & Optimization

ECS Auto-scaling based on CPU/memory

Aurora Serverless v2 for transactional DB scaling

Redis caching for hot queries (products, delivery slots)

CloudFront CDN for SPA assets and API caching

Event-driven decoupling via EventBridge + SQS

Security & Compliance

IAM least-privilege roles

KMS encryption for all data at rest

TLS 1.3 for all in-transit traffic

CloudTrail + Config + GuardDuty + Security Hub for auditing and monitoring

Cognito for authentication, MFA, and federated logins

Contributors

Christa Lococo – Technical Lead / Infrastructure & Microservices

Kevin L. Jones – Diagram & Architecture Design

Tom Duprey – Enhancements & Event-Driven Architecture

Next Steps

Implement API endpoints with real database queries

Integrate ERP/WMS/TMS systems

Add automated tests for all services

Deploy to AWS using CI/CD pipeline