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
instance_type = "t3.micro"
subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
key_name = data.terraform_remote_state.network_details.outputs.aws_key_pair
vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
tags = {
Name = "student.3-vm1"
  }
}

