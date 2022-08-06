terraform {
  backend "remote" {
    organization = "terraform-anil"

    workspaces {
      name = "terraform-course"
    }
  }
}