# Key -pair 

resource "aws_key_pair" "my-key-pair" {
  key_name   = "${var.env}-terra-key"
  public_key = "your pub key" 
}

# vpc 

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

## security group

resource "aws_security_group" "terra-sg" {
  name        = "${var.env}-terra-sg"
  description = "Allows http ans ssh traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "${var.env}-terra-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4        = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terra-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_instance" "my-instance" {
  count = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.my-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.terra-sg.id]

  tags = {
    Name = "${var.env}-terra-server-${count.index + 1}"
    Environment = "${var.env}"
  }
}

