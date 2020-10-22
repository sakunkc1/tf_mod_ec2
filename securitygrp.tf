resource "aws_security_group" "websg" {
    name = "websg"
    description = "allows http traffic"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags ={
        Name = "websg"
    }
}

resource "aws_security_group" "sshsg" {
    name = "sshsg"
    description = "allows ssh traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags ={
        Name = "sshsg"
    }
}