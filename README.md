# Terraform AWS Portfolio

This project provisions a basic AWS infrastructure using Terraform modules.

## インフラエンジニア用のポートフォリオ

Terraform を使用して AWS 環境を構築するポートフォリオです。`dev` / `prod` 環境の分離や、モジュールによる再利用性を意識しています。


## ディレクトリ構成
```
infra-aws-portfolio/
├── modules/
│   ├── ec2/
│   ├── ecs/
│   ├── elb/
│   ├── eventbridge/
│   ├── rds/
│   ├── s3/
│   ├── security_group/
│   ├── sns/
│   └── vpc/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── .gitignore
├── backend.tf
└── providers.tf
```

## 使用方法
environmentsの環境(dev/prod)にてそれぞれplan, applyを実行する。

## 前提条件
設定値(IPアドレスや名称、メールアドレス等)は各自の環境に合わせて修正すること。

## 今後の拡張予定
cloudwatchやLambdaなどでセキュリティ監視周りの強化をする予定です。
