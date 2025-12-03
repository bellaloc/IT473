terraform {
  source = "./"
}

inputs = {
  region = "us-east-1"
  az1    = "us-east-1a"
  az2    = "us-east-1b"
  env    = "dev"
}
