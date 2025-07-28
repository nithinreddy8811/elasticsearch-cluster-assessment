provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "elasticsearch_nodes" {
  count         = 5
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = element(["master", "data1", "data2", "ingest", "coordinator"], count.index)
    Role = element(["master", "data", "data", "ingest", "coordinator"], count.index)
  }

  root_block_device {
    volume_size = element([200, 1000, 1000, 200, 200], count.index)
  }
}
