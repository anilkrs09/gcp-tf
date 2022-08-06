terraform {
  backend "remote" {
    organization = "terraform-anil"

    workspaces {
      name = "gcp-tf"
    }
  }
}
