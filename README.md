# Terraform AWS Portfolio

This project provisions a basic AWS infrastructure using Terraform modules.

## インフラエンジニア用のポートフォリオ

Terraform を使用して AWS 環境を構築するポートフォリオです。`dev` / `prod` 環境の分離や、モジュールによる再利用性を意識しています。


## ディレクトリ構成
```
infra-aws-portfolio/
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── ecs/
│   ├── alb/
│   ├── cloudwatch/
│   └── s3/
├── cloudformation/
│   ├── monitoring-stack.yaml  ← SNS + CloudWatch Alarms + Lambda + EventBridge
│   └── README.md              ← スタック使い方メモ
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── outputs.tf
├── backend.tf
└── providers.tf
```

## AWS 構成図（環境ごとに展開）
```
+--------------------------------------------------------------+
|                     AWS Infrastructure (per env)            |
|                                                              |
|  +---------------------+           +----------------------+  |
|  |     Public Subnet   |           |    Private Subnet     | |
|  |  +----------------+ |           |  +------------------+  | |
|  |  |     ALB        |<----+      |  |      ECS (Fargate)|  | |
|  |  +----------------+ |   |      |  +------------------+  | |
|  +---------------------+   |      |                      |  |
|                            |      |  +------------------+  | |
|  +---------------------+   |      |  |      EC2 (Bastion)|  | |
|  |     S3 (Static Site)|   |      |  +------------------+  | |
|  +---------------------+   |      +----------------------+  |
|                            |                                |
|        +-----------------------------+                      |
|        |        Lambda (event-based) |                      |
|        +-----------------------------+                      |
|                    ↑                                         |
|         +------------------------+                          |
|         |   EventBridge (rules)  |                          |
|         +------------------------+                          |
|                    ↑                                         |
|         +------------------------+                          |
|         |   CloudWatch Alarms    |-------> SNS ------------>|
|         +------------------------+        (通知:Slack等)    |
+--------------------------------------------------------------+
```

## 使用方法

## 前提条件

## モジュールの説明

## 今後の拡張予定
