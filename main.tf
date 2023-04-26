data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = "student.3-james-bond-bucket"
    key = "student.3-network-state"
    region = "us-east-2"
  }
}
resource "aws_instance" "my_vm" {
ami = "ami-06c4532923d4ba1ec"
subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
instance_type = "t3.micro"
tags = {
Name = "student.3-vm1"
  }
}

