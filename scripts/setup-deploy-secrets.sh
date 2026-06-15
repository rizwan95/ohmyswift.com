#!/usr/bin/env bash
set -euo pipefail

# One-time setup: generate deploy key and store GitHub Actions secrets.
# Usage:
#   ./scripts/setup-deploy-secrets.sh <SSH_HOST> <SSH_USER> <DEPLOY_PATH>
#
# Example:
#   ./scripts/setup-deploy-secrets.sh 203.0.113.10 deploy /var/www/ohmyswift.com/

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <SSH_HOST> <SSH_USER> <DEPLOY_PATH>"
  exit 1
fi

SSH_HOST="$1"
SSH_USER="$2"
DEPLOY_PATH="$3"
KEY_PATH="${HOME}/.ssh/ohmyswift_deploy"

if [ ! -f "${KEY_PATH}" ]; then
  ssh-keygen -t ed25519 -f "${KEY_PATH}" -N "" -C "github-actions-ohmyswift-deploy"
fi

gh secret set SSH_HOST --body "${SSH_HOST}"
gh secret set SSH_USER --body "${SSH_USER}"
gh secret set DEPLOY_PATH --body "${DEPLOY_PATH}"
gh secret set SSH_PRIVATE_KEY < "${KEY_PATH}"

echo ""
echo "GitHub secrets configured."
echo ""
echo "Add this public key to the VPS (${SSH_USER}@${SSH_HOST}):"
echo ""
cat "${KEY_PATH}.pub"
echo ""
echo "On the VPS, run (as root):"
echo "  sudo mkdir -p ${DEPLOY_PATH}"
echo "  sudo chown -R ${SSH_USER}:www-data ${DEPLOY_PATH}"
echo "  sudo mkdir -p /home/${SSH_USER}/.ssh"
echo "  sudo bash -c 'cat >> /home/${SSH_USER}/.ssh/authorized_keys' <<'PUBKEY'"
cat "${KEY_PATH}.pub"
echo "PUBKEY"
echo "  sudo chown -R ${SSH_USER}:${SSH_USER} /home/${SSH_USER}/.ssh"
echo "  sudo chmod 700 /home/${SSH_USER}/.ssh"
echo "  sudo chmod 600 /home/${SSH_USER}/.ssh/authorized_keys"
echo ""
echo "Then trigger deploy: gh workflow run deploy.yml"
