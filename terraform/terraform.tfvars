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
    name        = "olha-sg-rule-allow-http"
  }

  allow_ssh_traffic = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-allow-ssh"
  }

  allow_https_traffic = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-allow-https"
  }

  allow_grafana_port_traffic = {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-grafana-port"
  }

  allow_ui_port_traffic = {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-ui-port"
  }

  allow_api_port_traffic = {
    from_port   = 7000
    to_port     = 7000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-api-port"
  }

  allow_prometheus_port_traffic = {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-prometheus-port"
  }

#   allow_node_explorer_port_traffic = {
#   from_port   = 9100
#   to_port     = 9100
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
#   name        = "olha-sg-rule-node_explorer-port"
#   }
}

instances = {
  public = {
    availability_zone           = "eu-west-2a"
    associate_public_ip_address = true
    name                        = "olha_public_server"
  }
}

public_route_table_name = "olha_public_route"