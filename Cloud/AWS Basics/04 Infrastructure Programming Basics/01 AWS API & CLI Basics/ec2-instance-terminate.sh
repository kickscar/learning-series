#! /bin/bash -e

INSTANCEID=$1

if [ -z "$INSTANCEID" ]; then
    echo "Usage: $0 <instance-id>"
    echo "Example: $0 i-0123456789abcdef0"
    exit 1
fi

# Get Instance ID & Security Group ID
SGID=$(aws ec2 describe-instances --instance-ids "$INSTANCEID" --query "Reservations[0].Instances[0].SecurityGroups[0].GroupId" --output text)

if [ "$SGID" == "None" ] || [ -z "$SGID" ]; then
    echo "Error: Could not find Security Group for instance $INSTANCEID"
    exit 1
fi

# Terminate the server(silently)
echo "terminating $INSTANCEID ..."
aws ec2 terminate-instances --instance-ids $INSTANCEID > /dev/null
aws ec2 wait instance-terminated --instance-ids $INSTANCEID

# Delete the security group
aws ec2 delete-security-group --group-id $SGID > /dev/null

echo "Done. Instance and its security group have been removed."
