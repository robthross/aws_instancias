output "php01" {
  value = aws_instance.php01.host_id
}

output "php02" {
  value = aws_instance.php02.host_id
}

# output "alb-php" {
#   value = aws_lb.alb-php.dns_name
# }

output "VPC" {
  value = aws_vpc.main.id
}

output "subneta" {
  value = aws_subnet.zonea.id
}

output "subnetb" {
  value = aws_subnet.zoneb.id
}