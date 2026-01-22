# Homelab Repository

This repository contains infrastructure-as-code and automation scripts for managing a personal homelab environment.

## Contents

### Home Assistant
- **Installer Script for Orange Pi Zero 3**: Automated installation script for Home Assistant Supervised on Orange Pi Zero 3
- **Device Configurations**: ESPHome YAML configurations for various ESP32/ESP8266 devices
  - ESP8266-BME280: Temperature/humidity sensor
  - ESP32-S3-LD2420: Presence detection sensor
  - ESP32-D1-Mini-LD2420_BME280: Combined presence detection and temperature sensor

### Terraform Workspace
Infrastructure-as-code configurations for AWS resources:
- **aws-vpc**: Complete VPC setup with EC2 instances for Kubernetes cluster
- **create-aws-instance**: Simple EC2 instance creation

## Security Considerations

⚠️ **IMPORTANT**: Before deploying the Terraform configurations to production:

1. **Restrict Security Group CIDR blocks**: The current security groups allow access from `0.0.0.0/0` (entire internet). Update the CIDR blocks in `Terraform-workspace/aws-vpc/security-group.tf` to restrict access to your specific IP addresses or trusted networks.

2. **AWS Credentials**: Ensure AWS credentials are configured properly and never committed to the repository. Use AWS IAM roles or environment variables.

3. **Terraform State**: State files are excluded from git via `.gitignore`. Consider using remote state management (e.g., S3 backend) for production.

## Prerequisites

### Home Assistant Setup
- Orange Pi Zero 3 (or compatible ARM64 device)
- Debian-based Linux distribution
- Internet connection

### Terraform
- Terraform >= 1.0
- AWS account with appropriate IAM permissions
- AWS CLI configured with credentials

## Usage

### Home Assistant Installation
```bash
cd Home-Assistant/Installer_script_for_OrangePiZero3
chmod +x InstallerScript.sh
sudo ./InstallerScript.sh
```

### Terraform Deployment
```bash
cd Terraform-workspace/aws-vpc
terraform init
terraform plan
terraform apply
```

## Contributing

This is a personal homelab repository. Feel free to fork and adapt for your own use.

## License

Personal use - see individual component licenses where applicable.
