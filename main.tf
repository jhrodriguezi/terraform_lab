terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~>6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = ""
}

resource "github_repository" "webpage" {
  name        = "webpage"
  description = "My awesome web page"
  visibility = "public"
   
  template {
    owner      = "luismayta"
    repository = "terraform-module-template"
  }
}

resource "github_branch" "feature1" {
  repository = github_repository.webpage.name
  branch     = "feature1"
  source_branch = "develop"
}

resource "github_branch" "hotfix" {
  repository = github_repository.webpage.name
  branch     = "hotfix"
  source_branch = "develop"
}

resource "github_branch" "testing" {
  repository = github_repository.webpage.name
  branch = "testing"
  source_branch = "develop"
}
