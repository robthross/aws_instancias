resource "aws_security_group" "http_ssh" {
  name        = "allow_22_and_80_ports"
  description = "Allow 22 and 80 port"
  vpc_id      = aws_vpc.main.id

  # allow ingress port 22
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  # allow ingress port 80 
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  # allow all egress port
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http_alb" {
  name        = "allow_80_ports"
  description = "Allow port 80"
  vpc_id      = aws_vpc.main.id


  # allow ingress port 80 
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  # allow all egress port
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}