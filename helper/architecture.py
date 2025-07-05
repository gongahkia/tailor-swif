from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import ECS
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.network import VPC
from diagrams.onprem.container import Docker
from diagrams.onprem.database import Postgresql
from diagrams.onprem.inmemory import Redis
from diagrams.onprem.client import User
from diagrams.programming.framework import React, Nextjs
from diagrams.programming.language import Typescript, Elixir
from diagrams.generic.network import Internet
from diagrams.custom import Custom

with Diagram("Tailor Swif Architecture", show=False, direction="LR", filename="tailor_swif_architecture"):

    user = User("Customer / Tailor")
    internet = Internet("Internet")

    with Cluster("Frontend"):
        nextjs = Nextjs("Next.js + TypeScript Frontend")
        clerk = Custom("Clerk Authentication", "./icons/clerk.png")
        shared_utils_frontend = Custom("Shared Types & Utils", "./icons/shared.png")

        nextjs >> Edge(label="Uses") >> clerk
        nextjs >> Edge(label="Imports") >> shared_utils_frontend

    with Cluster("Backend"):
        phoenix = Elixir("Phoenix + Elixir Backend")
        redis = Redis("Redis Cache & Pub/Sub")
        postgres = Postgresql("PostgreSQL DB")
        s3 = S3("AWS S3 Storage")
        shared_utils_backend = Custom("Shared Types & Utils", "./icons/shared.png")
        notification_service = Custom("Notification Service", "./icons/notification.png")
        transcription_service = Custom("Transcription Service", "./icons/transcription.png")
        phoenix >> Edge(label="Reads/Writes") >> postgres
        phoenix >> Edge(label="Caches & Pub/Sub") >> redis
        phoenix >> Edge(label="Stores Voice Messages") >> s3
        phoenix >> Edge(label="Uses") >> shared_utils_backend
        phoenix >> Edge(label="Sends Audio") >> transcription_service
        phoenix >> Edge(label="Sends Notifications") >> notification_service

    with Cluster("Deployment & Infrastructure"):
        aws_ecs = ECS("AWS ECS/EKS Cluster")
        aws_rds = RDS("AWS RDS (PostgreSQL)")
        aws_s3 = S3("AWS S3 Bucket")
        vpc = VPC("AWS VPC")
        terraform = Custom("Terraform", "./icons/terraform.png")
        github_actions = Custom("GitHub Actions / AWS CodePipeline", "./icons/github_actions.png")
        monitoring = Custom("Monitoring & Alerting", "./icons/monitoring.png")
        logging = Custom("Logging System", "./icons/logging.png")
        load_balancer = Custom("Load Balancer", "./icons/loadbalancer.png")
        ssl_termination = Custom("SSL Termination", "./icons/ssl.png")
        dns_service = Custom("DNS Service", "./icons/dns.png")
        backups = Custom("Database Backups", "./icons/backups.png")
        aws_ecs >> Edge(label="Runs Backend & Frontend Containers") >> phoenix
        aws_rds >> Edge(label="Managed DB") >> postgres
        aws_s3 >> Edge(label="Object Storage") >> s3
        vpc >> Edge(label="Network") >> aws_ecs
        vpc >> Edge(label="Network") >> aws_rds
        vpc >> Edge(label="Network") >> aws_s3
        terraform >> Edge(label="Provision Infrastructure") >> vpc
        github_actions >> Edge(label="Deploys") >> aws_ecs
        aws_ecs >> Edge(label="Sends Metrics") >> monitoring
        aws_rds >> Edge(label="Sends Metrics") >> monitoring
        redis >> Edge(label="Sends Metrics") >> monitoring
        phoenix >> Edge(label="Sends Logs") >> logging
        nextjs >> Edge(label="Sends Logs") >> logging
        aws_rds >> Edge(label="Backups") >> backups
        internet >> Edge(label="Routes Traffic") >> load_balancer
        load_balancer >> Edge(label="Routes to") >> aws_ecs
        load_balancer >> Edge(label="Handles SSL") >> ssl_termination
        internet >> Edge(label="DNS Resolution") >> dns_service
        dns_service >> Edge(label="Resolves") >> load_balancer
    user >> Edge(label="HTTP/HTTPS") >> internet >> nextjs
    nextjs >> Edge(label="REST/gRPC/WebSocket") >> phoenix
    nextjs >> Edge(label="Authentication") >> clerk
    phoenix >> Edge(label="Phoenix Channels WebSocket") >> nextjs
    redis >> Edge(label="Pub/Sub") >> phoenix
    nextjs >> Edge(label="Uploads Voice") >> phoenix
    phoenix >> Edge(label="Stores Voice") >> s3
    admin_dashboard = Custom("Admin Dashboard (Next.js)", "./icons/admin.png")
    admin_dashboard >> Edge(label="Manages Tailors") >> postgres
    admin_dashboard >> Edge(label="Uses") >> nextjs
    desktop_client = Custom("Tauri + Rust Desktop Client", "./icons/tauri.png")
    desktop_client >> Edge(label="Syncs") >> phoenix
    desktop_client >> Edge(label="Uses Shared Types & Utils") >> shared_utils_backend
    firebase = Custom("Firebase Cloud Messaging", "./icons/firebase.png")
    phoenix >> Edge(label="Push Notifications") >> firebase
    firebase >> Edge(label="Push to Users") >> user
    map_api = Custom("Google/Azure Maps API", "./icons/map.png")
    nextjs >> Edge(label="Map Integration") >> map_api
    git_repo = Custom("Git Repository", "./icons/git.png")
    git_repo >> Edge(label="Triggers") >> github_actions
    local_dev = Custom("Local Development", "./icons/localdev.png")
    local_dev >> Edge(label="Runs") >> Docker("Docker")
    local_dev >> Edge(label="Uses") >> terraform
    local_dev >> Edge(label="Uses") >> shared_utils_frontend
    local_dev >> Edge(label="Uses") >> shared_utils_backend