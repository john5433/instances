terraform {
  backend "s3" {
	bucket = "student.3-james-bond-bucket"
	key = "student.3-instance-state"
   	region = "us-east-2"
    }
  }

