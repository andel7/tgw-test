module "vpc1" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name = "vpc-1"
  cidr = "10.1.0.0/16"
  azs             = ["us-west-1a", "us-west-1c"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24"]
  tags = {
      Terraform = "true"
      Environment = "dev"
      Name = "vpc-1"
  }
  providers = {
    aws = aws.region1
  }
}
module "vpc2" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name = "vpc-2"
  cidr = "10.2.0.0/16"
  azs             = ["us-west-1a", "us-west-1c"]
  public_subnets  = ["10.2.101.0/24", "10.2.102.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name = "vpc-2"
  }
  providers = {
    aws = aws.region1
  }
}
module "vpc3" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name = "vpc-3"
  cidr = "10.3.0.0/16"

  azs             = ["us-west-1a", "us-west-1c"]
  public_subnets  = ["10.3.101.0/24", "10.3.102.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name = "vpc-3"
  }
  providers = {
    aws = aws.region1
  }
}

module "vpc4" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name = "vpc-4"
  cidr = "10.4.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  public_subnets  = ["10.4.101.0/24", "10.4.102.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name = "vpc-4"
  }
  providers = {
    aws = aws.region2
  }
}