data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = "student.3-james-bond-bucket"
    key = "student.3-network-state"
    region = "us-east-2"
  }
}

