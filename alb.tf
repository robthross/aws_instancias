resource "aws_lb" "alb-php" {
  name               = "alb-test"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http_alb.id]
  subnets            = [aws_subnet.zonea.id, aws_subnet.zoneb.id]

  depends_on = [
    aws_subnet.zonea,
    aws_subnet.zoneb
  ]
}



