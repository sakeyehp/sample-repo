module "virtual_network" {
  source = "./vpc"
}

resource "aws_eip" "sample-eip" {
  domain = "vpc"
}

resource "aws_eip_association" "sample-eip-assoc" {
    instance_id = aws_instance.demo-instance.id
    allocation_id = aws_eip.sample-eip.id
}

resource "aws_instance" "demo-instance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "KayodeSAKEYE"
  subnet_id = module.virtual_network.subnet_id
  security_groups = ["${module.virtual_network.sg_id}"]

#   provisioner "local-exec" {
#     command = "sleep 60"  # Wait for 60 seconds after instance creation
#   }
  tags = {
    Name = "ec2-instance"
  }
}