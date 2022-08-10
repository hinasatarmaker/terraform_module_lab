resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

module "public" {
  source = "./network_module"
  vpc_id = aws_vpc.main_vpc.id
  subnet_cidr = "10.0.1.0/24"
  subnet_name = "public_subnet"
  is_public = true
}

module "private" {
  source = "./network_module"
  vpc_id = aws_vpc.main_vpc.id
  subnet_cidr = "10.0.2.0/24"
  subnet_name = "private_subnet"
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "web_server"
  }
  subnet_id = module.public.subnet_id
}