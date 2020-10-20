
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "webapp" {
    instance_type = "t2.micro"
    ami           = "ami-0947d2ba12ee1ff75"
    key_name      = "aug2020"
    tags          = {
        Name      = "webapp01"
        environment = "dev"
        timetolive  = "10"
        backup      = "yes"
    }
}
