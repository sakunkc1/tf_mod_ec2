resource "aws_iam_user" "devusers"{
    count = 3
    name = "devops0${count.index}"
}