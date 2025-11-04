resource "aws_security_group" "public_lb" {
  name        = "${var.project_name}-public-lb-sg"
  description = "Allow HTTP from anywhere"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-Public-LB-SG"
  }
}

resource "aws_security_group" "web_tier" {
  name        = "${var.project_name}-web-tier-sg"
  description = "Allow HTTP from public LB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from public LB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-Web-Tier-SG"
  }
}

resource "aws_security_group" "internal_lb" {
  name        = "${var.project_name}-internal-lb-sg"
  description = "Allow HTTP from web tier"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from web tier"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web_tier.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-Internal-LB-SG"
  }
}

resource "aws_security_group" "private_app" {
  name        = "${var.project_name}-private-app-sg"
  description = "Allow TCP 4000 from internal LB"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow TCP 4000 from internal LB"
    from_port       = 4000
    to_port         = 4000
    protocol        = "tcp"
    security_groups = [aws_security_group.internal_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-Private-App-SG"
  }
}

resource "aws_security_group" "private_db" {
  name        = "${var.project_name}-private-db-sg"
  description = "Allow MySQL from private app tier"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL from private app tier"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.private_app.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-Private-DB-SG"
  }
}
