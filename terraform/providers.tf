terraform {
  
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

}

# Configure required_providers

provider "aws" {
    region = "ap-south-1" 
}