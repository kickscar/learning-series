#! /bin/bash -e

KEYNAME=$1

if [ -z "$KEYNAME" ]; then
    echo "Usage: $0 <key-pair-name>"
    echo "Example: $0 mykey"
    exit 1
fi

echo '[1] Get the ID of Amazon Linux AMI...'
AMIID=$(aws ssm get-parameter --name "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64" --query "Parameter.Value" --output text)

echo '[2] Get the default VPC ID...'
VPCID=$(aws ec2 describe-vpcs --query "Vpcs[?isDefault==true].VpcId" --output text)

echo '[3] Get the default subnet ID...'
SUBNETID=$(aws ec2 describe-subnets --query "(Subnets[?VpcId=='"$VPCID"'].SubnetId)[0]" --output text)

echo '[4] Create a security group...'
SGID=$(aws ec2 create-security-group --group-name my-securitygroup --description "My Security Group" --vpc-id $VPCID --query "GroupId" --output text)

echo '[5] Allow inbound SSH connections...'
Return=$(aws ec2 authorize-security-group-ingress --group-id $SGID --protocol tcp --port 22 --cidr 0.0.0.0/0 --query "Return" --output text)

echo '[6] Create and start the server...'
INSTANCEID=$(aws ec2 run-instances --image-id $AMIID --instance-type t3.micro --security-group-ids $SGID --subnet-id $SUBNETID --key-name $KEYNAME --query "Instances[0].InstanceId" --output text)

echo "waiting for $INSTANCEID..."
aws ec2 wait instance-running --instance-ids $INSTANCEID

echo '[7] Get the public name of server...'
PUBLICNAME=$(aws ec2 describe-instances --instance-ids $INSTANCEID --query "Reservations[0].Instances[0].PublicDnsName" --output text)

echo "------------------------------------------------"
echo "Instance ID: $INSTANCEID"
echo "Public DNS: $PUBLICNAME"
echo "Access via SSH:"
echo "ssh -i ${KEYNAME}.pem ec2-user@$PUBLICNAME"
echo "------------------------------------------------"