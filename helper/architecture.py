from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import ECS
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.network import VPC
from diagrams.onprem.container import Docker
from diagrams.onprem.database import Postgresql
from diagrams.onprem.inmemory import Redis
from diagrams.onprem.client import User
from diagrams.programming.framework import Nextjs
from diagrams.programming.language import Elixir
from diagrams.custom import Custom

with Diagram("Tailor Swif Architecture", show=False, direction="LR", filename="tailor_swif_architecture"):

    user = User("Customer / Tailor")
    internet = Custom("Internet", "internet.png")

    with Cluster("Frontend"):
        with Cluster("Web App"):
            nextjs = Nextjs("Next.js + TypeScript")
            clerk = Custom("Clerk Auth", "clerk.png")
            shared_utils_fe = Custom("Shared Utils", "shared.png")
            nextjs >> Edge(label="Uses Clerk for Auth") >> clerk
            nextjs >> Edge(label="Imports Shared Types/Utils") >> shared_utils_fe

        admin_dashboard = Custom("Admin Dashboard", "admin.png")
        admin_dashboard >> Edge(label="Uses Next.js UI") >> nextjs

        desktop_client = Custom("Tauri Desktop", "tauri.png")
        desktop_client >> Edge(label="Syncs with Next.js", style="dashed") >> nextjs
        desktop_client >> Edge(label="Imports Shared Types/Utils", style="dashed") >> shared_utils_fe

    with Cluster("Backend"):
        phoenix = Elixir("Phoenix + Elixir")
        redis = Redis("Redis")
        postgres = Postgresql("PostgreSQL")
        s3 = S3("AWS S3")
        shared_utils_be = Custom("Shared Utils", "shared.png")
        notification_service = Custom("Notification", "notification.png")
        transcription_service = Custom("Transcription", "transcription.png")

        phoenix >> Edge(label="Reads/Writes Data") >> postgres
        phoenix >> Edge(label="Caches & Pub/Sub") >> redis
        phoenix >> Edge(label="Stores Voice Messages") >> s3
        phoenix >> Edge(label="Imports Shared Types/Utils") >> shared_utils_be
        phoenix >> Edge(label="Sends Notifications") >> notification_service
        phoenix >> Edge(label="Sends Audio for Transcription") >> transcription_service

        admin_dashboard >> Edge(label="Manages Tailors", style="dashed") >> postgres
        desktop_client >> Edge(label="Syncs Data", style="dashed") >> phoenix

    with Cluster("Deployment & Infra"):
        aws_ecs = ECS("AWS ECS/EKS")
        aws_rds = RDS("AWS RDS")
        aws_s3 = S3("AWS S3 Bucket")
        vpc = VPC("AWS VPC")
        terraform = Custom("Terraform", "terraform.png")
        github_actions = Custom("GitHub Actions", "github_actions.png")
        monitoring = Custom("Monitoring", "monitoring.png")
        logging = Custom("Logging", "logging.png")
        load_balancer = Custom("Load Balancer", "loadbalancer.png")
        ssl_termination = Custom("SSL Termination", "ssl.png")
        dns_service = Custom("DNS", "dns.png")
        backups = Custom("Backups", "backups.png")

        vpc >> Edge(label="Network for ECS") >> aws_ecs
        vpc >> Edge(label="Network for RDS") >> aws_rds
        vpc >> Edge(label="Network for S3") >> aws_s3
        terraform >> Edge(label="Provisions Infra") >> vpc
        github_actions >> Edge(label="Deploys Containers") >> aws_ecs
        aws_ecs >> Edge(label="Runs Phoenix & Next.js") >> phoenix
        aws_ecs >> Edge(label="Runs Phoenix & Next.js") >> nextjs
        aws_rds >> Edge(label="Managed DB for App") >> postgres
        aws_s3 >> Edge(label="Object Storage for App") >> s3
        aws_rds >> Edge(label="Backups") >> backups
        aws_ecs >> Edge(label="Sends Metrics") >> monitoring
        aws_rds >> Edge(label="Sends Metrics") >> monitoring
        redis >> Edge(label="Sends Metrics") >> monitoring
        phoenix >> Edge(label="Sends Logs") >> logging
        nextjs >> Edge(label="Sends Logs") >> logging
        load_balancer >> Edge(label="Routes to ECS") >> aws_ecs
        load_balancer >> Edge(label="Handles SSL") >> ssl_termination
        dns_service >> Edge(label="Resolves to LB") >> load_balancer

    firebase = Custom("Firebase Cloud Messaging", "firebase.png")
    map_api = Custom("Google/Azure Maps", "map.png")
    git_repo = Custom("Git Repo", "git.png")
    local_dev = Custom("Local Dev", "localdev.png")

    user >> Edge(label="HTTP/HTTPS") >> internet
    internet >> Edge(label="Routes to LB") >> load_balancer
    load_balancer >> Edge(label="Routes to Next.js") >> nextjs
    nextjs >> Edge(label="API Calls (REST/gRPC/WebSocket)") >> phoenix
    nextjs >> Edge(label="Authentication") >> clerk
    nextjs >> Edge(label="Map Integration") >> map_api
    phoenix >> Edge(label="Push Notifications") >> firebase
    firebase >> Edge(label="Push to Users") >> user

    git_repo >> Edge(label="Triggers CI/CD") >> github_actions
    local_dev >> Edge(label="Runs Docker Compose") >> Docker("Docker")
    local_dev >> Edge(label="Uses Terraform") >> terraform
    local_dev >> Edge(label="Imports Shared Utils (FE)") >> shared_utils_fe
    local_dev >> Edge(label="Imports Shared Utils (BE)") >> shared_utils_be