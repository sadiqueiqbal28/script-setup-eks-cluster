# Script to setup and launch EKS Cluster

- Launch an EC2 Instance on AWS Console
    - Apply the security group with the instance
        - Inbound Rules (22,80,443)
        - ![Inbound-Image](https://github.com/sadiqueiqbal28/script-setup-eks-cluster/blob/main/images/inbound.png)
        - Outbound Rules (All Ports/*) - Anywhere accessible on IPv4
        - ![Inbound-Image](https://github.com/sadiqueiqbal28/script-setup-eks-cluster/blob/main/images/outbound.png)
    - Create a IAM Role with necessary permission and attach with your ec2 instance

**Clone the GitHub Respository**
`https://github.com/sadiqueiqbal28/script-setup-eks-cluster.git`

**Enter the working directory**
`cd script-setup-eks-cluster`

**Change Permissions**
`chmod +x script.sh`

**Execute the script**
`./script.sh`