terraform {
    backend "s3" {
        bucket = "talent-academy-hina30-lab-tfstates"
        key = "talent-academy/tf_module/terraform.tfstates"
        region = "eu-west-1"
        dynamodb_table = "terraform-lock"
        
    }
}