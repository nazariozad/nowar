output "instance_id" {
  value = aws_instance.nowar.id
}

output "ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}