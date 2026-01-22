# Security Policy

## Reporting a Vulnerability

This is a personal homelab repository. If you discover a security vulnerability, please open an issue or contact the repository owner.

## Security Considerations

### Terraform AWS Infrastructure

⚠️ **CRITICAL SECURITY WARNINGS**

The Terraform configurations in this repository are designed for **DEVELOPMENT AND TESTING ONLY**. They contain several security configurations that **MUST BE HARDENED** before production use:

#### 1. Security Group Rules - REQUIRES IMMEDIATE ATTENTION

The security group in `Terraform-workspace/aws-vpc/security-group.tf` currently allows access from **0.0.0.0/0** (the entire internet) on multiple ports:

- **SSH (port 22)**: Direct internet access to SSH is a major security risk
  - **FIX**: Restrict to your specific IP address: `cidr_blocks = ["YOUR_IP/32"]`
  - **BETTER**: Use AWS Session Manager or a bastion host

- **HTTP (port 80)**: Exposed to the internet
  - **FIX**: Consider using a load balancer with WAF
  - **OR**: Restrict to trusted networks only

- **Kubernetes API (port 6443)**: CRITICAL vulnerability
  - **FIX**: Restrict to your management network: `cidr_blocks = ["YOUR_IP/32"]`
  - **BETTER**: Use AWS VPN or PrivateLink

- **etcd (port 2379)**: CRITICAL vulnerability - should NEVER be exposed
  - **FIX**: Restrict to VPC internal only: `cidr_blocks = [aws_vpc.custom_vpc.cidr_block]`
  - **BETTER**: Use security group references instead of CIDR blocks

#### 2. AWS Credentials

- **NEVER** commit AWS credentials to this repository
- Use AWS IAM roles for EC2 instances
- Use environment variables or AWS CLI configuration
- Consider using AWS Secrets Manager for sensitive data

#### 3. SSH Key Management

- The Terraform configurations reference an SSH key named "aws-vpc-cluster"
- Ensure this key is properly secured and not committed to the repository
- Use strong key pairs (RSA 4096 or ED25519)
- Regularly rotate SSH keys

#### 4. Terraform State Files

- State files can contain sensitive data
- They are excluded via `.gitignore` - **ensure they are never committed**
- For production, use remote state with encryption (S3 + DynamoDB)
- Enable state file encryption

### Home Assistant Installation

#### InstallerScript.sh Security Notes

1. **Piped Installation**: The script uses `curl | sh` for Docker installation
   - This is convenient but can be risky
   - Consider downloading and reviewing the script first

2. **Package Versions**: Script pins specific versions (e.g., os-agent 1.7.2)
   - Check for security updates regularly
   - Visit https://github.com/home-assistant/os-agent/releases for latest versions

3. **Root Privileges**: Script requires sudo access
   - Review the script before running with elevated privileges
   - Understand what each step does

## Best Practices

1. **Network Segmentation**: Use VPCs, subnets, and security groups properly
2. **Principle of Least Privilege**: Grant only necessary permissions
3. **Regular Updates**: Keep all software and dependencies updated
4. **Monitoring**: Implement logging and monitoring for security events
5. **Backup**: Regular backups of critical data and configurations
6. **Encryption**: Use encryption at rest and in transit

## Production Hardening Checklist

Before using any configuration from this repository in production:

- [ ] Replace all `0.0.0.0/0` CIDR blocks with specific IP ranges
- [ ] Implement VPN or bastion host for SSH access
- [ ] Use AWS Secrets Manager or Parameter Store for secrets
- [ ] Enable CloudTrail logging
- [ ] Configure VPC Flow Logs
- [ ] Implement AWS Config rules
- [ ] Set up CloudWatch alarms
- [ ] Enable AWS GuardDuty
- [ ] Use AWS WAF for web applications
- [ ] Implement multi-factor authentication (MFA)
- [ ] Review and update security groups regularly
- [ ] Use private subnets for non-public resources
- [ ] Implement proper backup and disaster recovery

## Disclaimer

This repository is provided for educational and personal homelab purposes. The configurations are NOT secure by default and require significant hardening for production use. Use at your own risk.
