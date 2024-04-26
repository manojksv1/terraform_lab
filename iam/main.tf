provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "node_policy" {
  Name = "node_policy"

  // Attach AWS Managed Policy
  managed_policy_arns = ["arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"]
  tags = {
    from = "terraform"
  }
}