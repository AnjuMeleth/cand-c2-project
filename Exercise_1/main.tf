# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  region = "us-west-2"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "T2" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-02d0ea44ae3fe9561"
  instance_type = "t2.micro"
  subnet_id     = "subnet-051f8172e92c7b08b"
  tags = {
    Name = "Udacity T2-${count.index}"

  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "M4" {
  count = 2 # create four similar EC2 instances

  ami           = "ami-02d0ea44ae3fe9561"
  instance_type = "m4.large"
  subnet_id	= "subnet-00db17ac0c08f5564"
  tags = {
    Name = "Udacity M4-${count.index}"
  }
}

