package io.kickscar.cloud.aws.utils;

import software.amazon.awssdk.services.ec2.model.InstanceType;

public final class Ec2InstanceType {
    public static final InstanceType T2_MICRO = InstanceType.T2_MICRO;
    public static final InstanceType T2_SMALL = InstanceType.T2_SMALL;
    public static final InstanceType T3_MICRO = InstanceType.T3_MICRO;
    public static final InstanceType T3_SMALL = InstanceType.T3_SMALL;

    public static InstanceType of(String value) {
        return InstanceType.fromValue(value);
    }
}
