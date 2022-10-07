data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "php01" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  # vpc_security_group_ids      = [aws_security_group.http_ssh.id]
  associate_public_ip_address = true
  key_name                    = "wy-a4f84a230c77"
  subnet_id                   = aws_subnet.zonea.id

  tags = {
    sysId = "6f1bb632-da38-4e1f-86c3-6065f8662f88"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = "wy-a4f84a230c77"
      private_key = file("~/.ssh/aws_key.pem")
      host        = aws_instance.php01.public_dns
    }
  }

  provisioner "local-exec" {
    working_dir = "templates"

    command = "ansible-playbook -i ${aws_instance.php01.public_dns}, -u wy-a4f84a230c77 --private-key ~/.ssh/aws_key.pem php.yaml"


  }

}

resource "aws_instance" "php02" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  # vpc_security_group_ids      = [aws_security_group.http_ssh.id]
  associate_public_ip_address = true
  key_name                    = "wy-a4f84a230c77"
  subnet_id                   = aws_subnet.zoneb.id

  tags = {
    sysId = "6f1bb632-da38-4e1f-86c3-6065f8662f88"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = "wy-a4f84a230c77"
      private_key = file("~/.ssh/aws_key.pem")
      host        = aws_instance.php02.public_dns
    }
  }

  provisioner "local-exec" {
    working_dir = "templates"

    command = "ansible-playbook -i ${aws_instance.php02.public_dns}, -u wy-a4f84a230c77 --private-key ~/.ssh/aws_key.pem php.yaml"
  }

}