# Automated Linux Server Provisioning and Hardening

Production-focused Bash automation suite for provisioning, securing, and monitoring Linux servers without manual configuration drift.

## Key Capabilities
- **Automated User & Access Setup:** Creates non-root admin accounts, enforces SSH key-based authentication, and configures least-privilege `sudo` policies.
- **Security Hardening:** Hardens `/etc/ssh/sshd_config` (disables root login and password authentication) and configures **UFW** firewall rules to restrict inbound traffic.
- **Automated Health & Log Monitoring:** Scheduled **Cron** jobs monitor CPU, memory, and disk utilization, automate package security updates, and rotate system logs.

## Tech Stack
- **OS:** Ubuntu / Debian Linux
- **Scripting & Automation:** Bash, Cron
- **Security & Networking:** OpenSSH, UFW, Fail2Ban, systemd

## Quick Start
```bash
git clone [https://github.com/jagadeeshkaranam99/Automated-Linux-Server-Provisioning-and-Hardening.git](https://github.com/jagadeeshkaranam99/Automated-Linux-Server-Provisioning-and-Hardening.git)
cd Automated-Linux-Server-Provisioning-and-Hardening
chmod +x scripts/*.sh
sudo ./scripts/harden_ssh_firewall.sh
