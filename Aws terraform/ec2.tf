
resource "aws_instance" "bastion" {
  subnet_id         = aws_subnet.public.id
  instance_type     = "t2.micro"  
  ami               = "ami-0b98a32b1c5e0d105"  
  security_groups   = [aws_security_group.bastion_sg.name]
}


resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"  
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "admin12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}


resource "aws_db_subnet_group" "default" {
  name       = "mydb-subnet-group"
  subnet_ids = [aws_subnet.private.id,aws_subnet.public.id]
}