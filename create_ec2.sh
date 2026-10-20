#!/bin/bash
# Automate AWS EC2 instance creation

set -euo pipefail

# Check AWS CLI
check_awscli() {
    if ! command -v aws &>/dev/null; then
        echo "AWS CLI not installed." >&2
        exit 1
    fi
}

# Install AWS CLI v2
install_awscli() {
    echo "Installing AWS CLI..."

    curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    sudo apt-get install -y unzip &>/dev/null
    unzip -q awscliv2.zip
    sudo ./aws/install

    aws --version
    rm -rf awscliv2.zip ./aws
}

# Wait for EC2 instance
wait_for_instance() {
    local instance_id="$1"
    echo "Waiting for instance: $instance_id"

    while true; do
        state=$(aws ec2 describe-instances \
            --instance-ids "$instance_id" \
            --query 'Reservations[0].Instances[0].State.Name' \
            --output text)

        if [[ "$state" == "running" ]]; then
            echo "Instance is running."
            break
        fi

        sleep 10
    done
}

# Create EC2 instance
create_ec2_instance() {
    local ami_id="$1"
    local instance_type="$2"
    local key_name="$3"
    local subnet_id="$4"
    local security_group_ids="$5"
    local instance_name="$6"
    local instance_id

    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text)

    if [[ -z "$instance_id" || "$instance_id" == "None" ]]; then
        echo "Failed to create EC2 instance." >&2
        exit 1
    fi

    echo "Instance created: $instance_id"
    wait_for_instance "$instance_id"
}

# Main workflow
main() {
    if ! command -v aws &>/dev/null; then
        install_awscli
    fi

    check_awscli
    echo "Creating EC2 instance..."

    # Set AWS configuration
    AMI_ID=""
    INSTANCE_TYPE="t2.micro"
    KEY_NAME=""
    SUBNET_ID=""
    SECURITY_GROUP_IDS=""
    INSTANCE_NAME="Shell-Script-EC2-Demo"

    create_ec2_instance \
        "$AMI_ID" \
        "$INSTANCE_TYPE" \
        "$KEY_NAME" \
        "$SUBNET_ID" \
        "$SECURITY_GROUP_IDS" \
        "$INSTANCE_NAME"

    echo "EC2 creation completed."
}

main "$@"