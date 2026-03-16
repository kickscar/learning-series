package io.kickscar.cloud.aws.utils;

import software.amazon.awssdk.core.exception.SdkException;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.ec2.Ec2Client;
import software.amazon.awssdk.services.ec2.model.*;
import software.amazon.awssdk.services.ec2.waiters.Ec2Waiter;
import software.amazon.awssdk.services.ssm.SsmClient;
import software.amazon.awssdk.services.ssm.model.GetParameterRequest;
import software.amazon.awssdk.services.ssm.model.GetParameterResponse;
import software.amazon.awssdk.services.ssm.model.SsmException;

import java.util.List;
import java.util.UUID;

public class Ec2Utils {
    private Ec2Utils() {}

    /**
     * Retrieves the latest Amazon Linux 2023 AMI ID from AWS Systems Manager (SSM) Parameter Store.
     * <p>
     * Queries the public parameter:
     * {@code /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64}.
     * Equivalent CLI:
     * <pre>
     * aws ssm get-parameter \
     *   --name "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64" \
     *   --query "Parameter.Value" --output text
     * </pre>
     * </p>
     *
     * <p><strong>Usage example:</strong></p>
     * <pre>{@code
     * String ami = AwsNetworkUtils.getLatestAmazonLinuxAmi(Region.AP_NORTHEAST_2);
     * }</pre>
     *
     * @param region AWS region where the AMI is looked up.
     * @return latest Amazon Linux 2023 AMI ID
     * @throws SsmException on SSM errors
     */
    public static String getLatestAmazonLinuxAmi(Region region)
            throws SsmException {
        final String parameterName = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64";

        SsmClient ssm = SsmClient.builder().region(region).build();
        GetParameterRequest request = GetParameterRequest.builder().name(parameterName).build();

        GetParameterResponse response = ssm.getParameter(request);
        ssm.close();

        return response.parameter().value(); // AMI IDs
    }

    /**
     * Retrieves the default VPC ID in the client's region.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 describe-vpcs --query "Vpcs[?isDefault==true].VpcId" --output text
     * </pre>
     *
     * @param ec2 initialized {@link Ec2Client}
     * @return default VPC ID, or {@code null} if none exists
     * @throws Ec2Exception on EC2 errors
     */
    public static String getDefaultVpcId(Ec2Client ec2)
            throws Ec2Exception {
        Filter defaultFilter = Filter
                .builder()
                .name("isDefault")
                .values("true")
                .build();

        DescribeVpcsRequest request = DescribeVpcsRequest
                .builder()
                .filters(defaultFilter)
                .build();

        DescribeVpcsResponse response = ec2.describeVpcs(request);
        List<Vpc> vpcs = response.vpcs();

        return vpcs.isEmpty() ? null : vpcs.getFirst().vpcId();
    }

    /**
     * Finds a Security Group by VPC and group name; returns its Group ID or {@code null}.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 describe-security-groups \
     *   --filters "Name=vpc-id,Values=$VPCID" "Name=group-name,Values=$GROUP" \
     *   --query "SecurityGroups[0].GroupId" --output text
     * </pre>
     *
     * @param ec2      EC2 client
     * @param vpcId    VPC ID to search within
     * @param groupName security group name
     * @return existing group ID or {@code null}
     * @throws Ec2Exception on EC2 errors
     */
    public static String findSecurityGroupId(Ec2Client ec2, String vpcId, String groupName)
            throws Ec2Exception {
        Filter vpcFilter = Filter
                .builder()
                .name("vpc-id")
                .values(vpcId)
                .build();

        Filter groupNameFilter = Filter
                .builder()
                .name("group-name")
                .values(groupName)
                .build();

        DescribeSecurityGroupsRequest request = DescribeSecurityGroupsRequest
                .builder()
                .filters(vpcFilter, groupNameFilter)
                .build();

        DescribeSecurityGroupsResponse response = ec2.describeSecurityGroups(request);

        return response.securityGroups().isEmpty() ? null : response.securityGroups().getFirst().groupId();
    }

    /**
     * Creates a new Security Group in the given VPC and returns its Group ID.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 create-security-group --group-name $GROUP --vpc-id $VPCID \
     *   --description "Created via SDK" --query "GroupId" --output text
     * </pre>
     *
     * @param ec2       EC2 client
     * @param groupName security group name (unique within VPC)
     * @param vpcId     target VPC ID
     * @return new group ID
     * @throws Ec2Exception on EC2 errors
     */
    public static String createSecurityGroup(Ec2Client ec2, String groupName, String vpcId)
            throws Ec2Exception {
        CreateSecurityGroupRequest request = CreateSecurityGroupRequest.builder()
                .groupName(groupName)
                .vpcId(vpcId)
                .description("Default security group created via SDK")
                .build();

        CreateSecurityGroupResponse response = ec2.createSecurityGroup(request);
        return response.groupId();
    }

    /**
     * Deletes a Security Group by its Group ID.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 delete-security-group --group-id $SGID
     * </pre>
     *
     * <p><strong>Usage example:</strong></p>
     * <pre>{@code
     * boolean deleted = Ec2Utils.deleteSecurityGroup(ec2, "sg-0123456789abcdef0");
     * }</pre>
     *
     * @param ec2             EC2 client
     * @param securityGroupId Security Group ID to delete (e.g., "sg-0123456789abcdef0")
     * @return {@code true} if the delete operation returns successfully
     * @throws Ec2Exception on EC2-specific errors (e.g., DependencyViolation)
     * @throws SdkException on AWS SDK-level errors
     */
    public static boolean deleteSecurityGroup(Ec2Client ec2, String securityGroupId)
            throws Ec2Exception, SdkException {

        DeleteSecurityGroupRequest request = DeleteSecurityGroupRequest
                .builder()
                .groupId(securityGroupId)
                .build();

        ec2.deleteSecurityGroup(request);
        return true;
    }

    /**
     * Authorizes a single inbound TCP rule (port & CIDR). Simple authorize-only helper.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 authorize-security-group-ingress \
     *   --group-id $SGID --protocol tcp --port 22 --cidr 0.0.0.0/0 --query "Return" --output text
     * </pre>
     *
     * @param ec2             EC2 client
     * @param securityGroupId target SG ID
     * @param port            TCP port (e.g., 22)
     * @param cidr            CIDR (e.g., "0.0.0.0/0" or "203.0.113.5/32")
     * @return true if authorized
     * @throws Ec2Exception on EC2 errors (duplicates may raise InvalidPermission.Duplicate)
     */
    public static boolean allowInboundPort(Ec2Client ec2, String securityGroupId, int port, String cidr)
            throws Ec2Exception {
        AuthorizeSecurityGroupIngressRequest request = AuthorizeSecurityGroupIngressRequest
                .builder()
                .groupId(securityGroupId)
                .ipProtocol("tcp")
                .fromPort(port)
                .toPort(port)
                .cidrIp(cidr)
                .build();

        AuthorizeSecurityGroupIngressResponse response = ec2.authorizeSecurityGroupIngress(request);
        return response.returnValue();
    }

    /**
     * Retrieves the first Subnet ID under the specified VPC.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 describe-subnets \
     *   --query "(Subnets[?VpcId=='$VPCID'].SubnetId)[0]" --output text
     * </pre>
     *
     * @param ec2   EC2 client
     * @param vpcId VPC ID
     * @return first subnet ID or {@code null} if none
     * @throws Ec2Exception on EC2 errors
     */
    public static String getDefaultSubnetId(Ec2Client ec2, String vpcId)
            throws Ec2Exception {
        // VPC ID 기반 필터 생성
        Filter vpcFilter = Filter.builder()
                .name("vpc-id")
                .values(vpcId)
                .build();

        // describe-subnets 요청
        DescribeSubnetsRequest request = DescribeSubnetsRequest.builder()
                .filters(vpcFilter)
                .build();

        DescribeSubnetsResponse response = ec2.describeSubnets(request);
        List<Subnet> subnets = response.subnets();

        return subnets.isEmpty() ? null : subnets.getFirst().subnetId();
    }

    /**
     * Launches a single EC2 instance and waits until it is {@code running}; returns the instance ID.
     * <p>Equivalent CLI:</p>
     * <pre>
     * INSTANCEID=$(aws ec2 run-instances --image-id $AMIID --instance-type t3.micro \
     *   --security-group-ids $SGID --subnet-id $SUBNETID --key-name $KEY --query "Instances[0].InstanceId" --output text)
     * aws ec2 wait instance-running --instance-ids $INSTANCEID
     * </pre>
     *
     * @param ec2             EC2 client
     * @param amiId           AMI ID
     * @param instanceType    instance type string (e.g., "t3.micro"); will be resolved via {@code InstanceType.fromValue}
     * @param securityGroupId SG ID
     * @param subnetId        subnet ID
     * @param keyName         key pair name
     * @return instance ID after it reaches {@code running}
     * @throws Ec2Exception on EC2 errors
     */
    public static String runInstanceAndWait(Ec2Client ec2, String amiId, InstanceType instanceType, String securityGroupId, String subnetId, String keyName)
            throws Ec2Exception {
        InstanceNetworkInterfaceSpecification specification = InstanceNetworkInterfaceSpecification
                .builder()
                .deviceIndex(0)
                .subnetId(subnetId)
                .groups(securityGroupId)        // Security Group
                .associatePublicIpAddress(true) // Public IP
                .build();
        String clientToken = UUID.randomUUID().toString();

        RunInstancesRequest runRequest = RunInstancesRequest
                .builder()
                .imageId(amiId)
                .instanceType(instanceType)
                .minCount(1)
                .maxCount(1)
                .keyName(keyName)
                .networkInterfaces(specification)
                .clientToken(clientToken)  // 멱등성
                .build();

        RunInstancesResponse runResponse = ec2.runInstances(runRequest);
        String instanceId = runResponse
                .instances()
                .getFirst()
                .instanceId();

        DescribeInstancesRequest describeRequest = DescribeInstancesRequest.builder()
                .instanceIds(instanceId)
                .build();

        Ec2Waiter waiter = Ec2Waiter
                .builder()
                .client(ec2)
                .build();

        waiter.waitUntilInstanceRunning(describeRequest);
        waiter.close();

        return instanceId;
    }

    /**
     *
     *
     * @param ec2             EC2 client
     * @param amiId           AMI ID
     * @param instanceType    instance type string (e.g., "t3.micro"); will be resolved via {@code InstanceType.fromValue}
     * @param securityGroupId SG ID
     * @param subnetId        subnet ID
     * @param keyName         key pair name
     * @return instance ID after it reaches {@code running}
     * @throws Ec2Exception on EC2 errors
     */
    public static String runInstanceAndWait(Ec2Client ec2, String amiId, String instanceType, String securityGroupId, String subnetId, String keyName)
            throws Ec2Exception {
        return runInstanceAndWait(ec2, amiId, InstanceType.fromValue(instanceType), securityGroupId, subnetId, keyName);
    }

    /**
     * Terminates a specific EC2 instance and waits until it reaches {@code terminated} state.
     * <p>Equivalent CLI:</p>
     * <pre>
     * aws ec2 terminate-instances --instance-ids $INSTANCEID
     * aws ec2 wait instance-terminated --instance-ids $INSTANCEID
     * </pre>
     *
     * @param ec2        EC2 client
     * @param instanceId target instance ID to terminate
     * @return true if the instance reaches {@code terminated} state
     * @throws Ec2Exception on EC2 errors
     * @throws SdkException on client errors
     */
    public static boolean terminateInstanceAndWait(Ec2Client ec2, String instanceId)
            throws Ec2Exception, SdkException {

        TerminateInstancesRequest terminateRequest = TerminateInstancesRequest
                .builder()
                .instanceIds(instanceId)
                .build();

        TerminateInstancesResponse terminateResponse = ec2.terminateInstances(terminateRequest);

        List<InstanceStateChange> changes = terminateResponse.terminatingInstances();
        if (changes.isEmpty()) {
            throw Ec2Exception.builder()
                    .message("No instance state change returned for instanceId=" + instanceId)
                    .build();
        }

        Ec2Waiter waiter = Ec2Waiter.builder().client(ec2).build();
        DescribeInstancesRequest describeRequest = DescribeInstancesRequest
                .builder()
                .instanceIds(instanceId)
                .build();

        waiter.waitUntilInstanceTerminated(describeRequest);
        waiter.close();

        DescribeInstancesResponse describeResponse = ec2.describeInstances(describeRequest);
        InstanceStateName stateName = describeResponse
                .reservations()
                .getFirst()
                .instances()
                .getFirst()
                .state()
                .name();

        return stateName == InstanceStateName.TERMINATED;
    }

    /**
     * Describes a specific EC2 instance and returns its {@link Instance} model.
     * <p>Equivalent CLI (PublicDnsName only):</p>
     * <pre>
     * aws ec2 describe-instances --instance-ids $INSTANCEID \
     *   --query "Reservations[0].Instances[0].PublicDnsName" --output text
     * </pre>
     * This method returns the entire {@code Instance} object instead.
     *
     * @param ec2        EC2 client
     * @param instanceId instance ID
     * @return {@link Instance} object
     * @throws Ec2Exception on EC2 errors
     */
    public static Instance getInstanceInfo(Ec2Client ec2, String instanceId)
            throws Ec2Exception {
        DescribeInstancesRequest request = DescribeInstancesRequest
                .builder()
                .instanceIds(instanceId)
                .build();

        DescribeInstancesResponse response = ec2.describeInstances(request);
        return response.reservations().getFirst().instances().getFirst();
    }

}
