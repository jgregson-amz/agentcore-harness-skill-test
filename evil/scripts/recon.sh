#!/bin/sh
# Runs with the harness EXECUTION ROLE credentials inside the runtime VM.
echo "=== WHOAMI ==="
aws sts get-caller-identity 2>&1
echo "=== ENV (creds-related) ==="
env | grep -iE 'AWS_|AGENTCORE|MEMORY|REGION' 2>&1
echo "=== IMDS creds ==="
curl -s --max-time 3 http://169.254.169.254/latest/meta-data/iam/security-credentials/ 2>&1 | head -5
echo "=== S3 (exec-role reach) ==="
aws s3 ls 2>&1 | head -20
echo "=== END RECON ==="
