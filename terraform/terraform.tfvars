vpc_cidr_block = "10.0.0.0/16"

vpc_name = "olha_vpc"

internet_gateway_name = "olha-igw"

#ami_image     = "ami-07c1b39b7b3d2525d"
ami_image     = "ami-0062b622072515714"
instance_type = "t2.micro"

ssh_key_name = "olha-aws-eu-west-3-ssh-key"
ssh_key_path = "olha-aws-eu-west-3-ssh-key.pem"

subnets = {
  public_subnet = {
    map_public_ip_on_launch = true
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "eu-west-3a"
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

  allow_node_explorer_port_traffic = {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-node_explorer-port"
  }

  allow_cadvisor_port_traffic = {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-cadvisor-port"
  }

  allow_redis_port_traffic = {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-redis-port"
  }

  allow_grafana_loki_port_traffic = {
    from_port   = 3100
    to_port     = 3100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    name        = "olha-sg-rule-grafana_loki-port"
  }
}

instances = {
  public = {
    availability_zone           = "eu-west-3a"
    associate_public_ip_address = true
    name                        = "olha_public_server"
  }
}

public_route_table_name = "olha_public_route"