resource "aws_elb_attachment" "elb" {
  elb      = aws_elb.elb.id
  instance = var.instance_type
}