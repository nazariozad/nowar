resource "aws_instance" "nowar" {
  count                  = var.instances
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t3.micro"
  # key_name               = "key"
  vpc_security_group_ids = [aws_security_group.nowar.id]

  # cat /var/log/cloud-init-output.log
  user_data = templatefile("user_data.sh.tpl", {
    hosts = var.urls
  })

  tags = {
    Name  = "nowar"
    Owner = "Ukraine"
  }
}

resource "aws_security_group" "nowar" {
  name        = "stop war"
  description = "stop war"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "stop war"
    Owner = "Ukraine"
  }
}
