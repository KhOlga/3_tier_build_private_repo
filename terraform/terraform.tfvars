vpc_cidr_block = "10.0.0.0/16"

vpc_name = "olha_vpc"

internet_gateway_name = "olha-igw"

ami_image     = "ami-07c1b39b7b3d2525d"
instance_type = "t2.micro"

ssh_key_name = "olha-aws-eu-west-2-ssh-key"

subnets = {
  public_subnet = {
    map_public_ip_on_launch = true
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "eu-west-2a"
    name                    = "olha-public-subnet"
  }
}

sg_name = {
  "public" : "olha-grp-public"
}

inbound_rule = {

  allow_http_traffic = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-allow_http"
  }

  allow_ssh_traffic = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-allow_ssh"
  }

  allow_https_traffic = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-allow_https"
  }
}

instances = {
  public = {
    availability_zone           = "eu-west-2a"
    associate_public_ip_address = true
    name                        = "olha_public_server"
  }
}

public_route_table_name = "olha_public_route"