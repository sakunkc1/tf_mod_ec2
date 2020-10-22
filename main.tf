
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webapp" {
    instance_type = var.instance_type
    ami           = data.aws_ami.amazonlx.id
    key_name      = var.keyname
    vpc_security_group_ids = [aws_security_group.websg.id , aws_security_group.sshsg.id]
    user_data = <<-EOF
    #!/bin/bash
    yum -y install httpd
    systemctl start httpd
    systemctl enable httpd
    echo "welcome to devops" > /var/wwww/html/index.html
    EOF
    tags          = {
        Name      = "webappdev01"
        environment = "develope"
        timetolive  = "10"
        backup      = "no"
        
    }
}
