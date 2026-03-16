package io.kickscar.cloud.aws.utils;

import org.junit.jupiter.api.*;
import org.junit.jupiter.api.condition.EnabledIfEnvironmentVariable;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.ec2.Ec2Client;
import software.amazon.awssdk.services.ec2.model.Instance;

import java.util.Optional;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * End-to-end integration test for EC2 provisioning using Ec2Utils.
 * <p>
 * This test is DISABLED by default and only runs when the environment variable
 * RUN_EC2_END_TO_END is set to "true", to avoid accidental costs.
 * <p>
 * Required environment variables (recommended):
 * - RUN_EC2_END_TO_END=true
 * - AWS_REGION=ap-northeast-2
 * - KEY_NAME=your-keypair-name
 * - SECURITY_GROUP_NAME=demo-sg
 * <p>
 * Optional:
 * - DELETE_RESOURCES=true   // delete created resources after test
 * <p>
 * Notes:
 * - Uses default VPC & first subnet.
 * - Opens SSH(22) to 0.0.0.0/0 for demo; restrict to your /32 in real usage.
 */
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@EnabledIfEnvironmentVariable(named="RUN_EC2_END_TO_END", matches="true")
public class Ec2EndToEndTest {
    private static Ec2Client ec2;
    private static Region REGION;
    private static String KEY_NAME;
    private static String SECURITY_GROUP_NAME;

    // resources created/used in test
    private static String vpcId;
    private static String securityGroupId;
    private static String subnetId;
    private static String amiId;
    private static String instanceId;

    @BeforeAll
    public static void setUp() {
        REGION = Optional
                .ofNullable(System.getenv("AWS_REGION"))
                .map(Region::of)
                .orElse(Region.AP_NORTHEAST_2);

        KEY_NAME = Optional
                .ofNullable(System.getenv("KEY_NAME"))
                .orElseThrow(() -> new IllegalStateException("KEY_NAME env is required"));

        SECURITY_GROUP_NAME = Optional
                .ofNullable(System.getenv("SECURITY_GROUP_NAME"))
                .orElse("demo-sg");

        ec2 = Ec2Client
                .builder()
                .region(REGION)
                .build();
    }

    @AfterAll
    public static void tearDown() {
        if (ec2 != null) {
            ec2.close();
        }
    }

    @Order(1)
    @Test
    public void testGetLatestAmazonLinuxAmi() {
        amiId = Ec2Utils.getLatestAmazonLinuxAmi(REGION);
        assertNotNull(amiId, "AMI ID must be non-null after successful lookup");
    }

    @Order(2)
    @Test
    public void testGetDefaultVpcId() {
        vpcId = Ec2Utils.getDefaultVpcId(ec2);
        assertNotNull(vpcId, "Default VPC must exist for this test");
    }

    @Order(3)
    @Test
    public void testFindSecurityGroupIdAndCreateSecurityGroupAndAllowInboundPort() {
        securityGroupId = Optional
                .ofNullable(Ec2Utils.findSecurityGroupId(ec2, vpcId, SECURITY_GROUP_NAME))
                .orElseGet(() -> {
                    String newSecurityGroupId = Ec2Utils.createSecurityGroup(ec2, SECURITY_GROUP_NAME, vpcId);
                    Ec2Utils.allowInboundPort(ec2, newSecurityGroupId, 22, "0.0.0.0/0");

                    return newSecurityGroupId;
                });

        assertNotNull(securityGroupId, "Security Group ID must be available");
    }

    @Order(4)
    @Test
    public void testGetDefaultSubnetId() {
        subnetId = Ec2Utils.getDefaultSubnetId(ec2, vpcId);
        assertNotNull(subnetId, "At least one subnet must exist");
    }

    @Order(5)
    @Test
    public void testRunInstanceAndWait() {
        instanceId = Ec2Utils.runInstanceAndWait(ec2, amiId, Ec2InstanceType.T3_MICRO, securityGroupId, subnetId, KEY_NAME);
        assertNotNull(instanceId, "Instance ID should be returned");
    }

    @Order(6)
    @Test
    public void testGetInstanceInfo() {
        Instance instance = Ec2Utils.getInstanceInfo(ec2, instanceId);
        assertNotNull(instance);

        boolean deleteResources = Boolean.parseBoolean(Optional.ofNullable(System.getenv("DELETE_RESOURCES")).orElse("false"));
        if (!deleteResources) {
            String publicDnsName = instance.publicDnsName();
            assertNotNull(publicDnsName, "Public DNS must be assigned (ensure public IP association)");

            System.out.printf("EC2 Instance[%s] SSH: ec2-user@%s%n", instanceId, publicDnsName);
            System.out.printf("$ ssh -i {your-key}.pem ec2-user@%s%n", publicDnsName);
        }
    }

    @Order(7)
    @Test
    @EnabledIfEnvironmentVariable(named="DELETE_RESOURCES", matches="true")
    void testTerminateInstanceAndWait() {
        assertTrue(Ec2Utils.terminateInstanceAndWait(ec2, instanceId), "Instance should be terminated");
    }

    @Order(8)
    @Test
    @EnabledIfEnvironmentVariable(named="DELETE_RESOURCES", matches="true")
    void testDeleteSecurityGroup() {
        assertTrue(Ec2Utils.deleteSecurityGroup(ec2, securityGroupId), "Security Group should be deleted");
    }

}
