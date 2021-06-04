variable "create_user" {
  description = "Whether to create users"
  type        = bool
  default     = true
}

variable "users" {
  description = "List of users to create"
  type = list(object({
    email    = string
    name     = string
    login    = string
    password = string
    is_admin = bool
  }))
}

variable "create_org" {
  description = "Whether to create organizations"
  type        = bool
  default     = true
}

variable "orgs" {
  description = "List of organizations to create"
  type = list(object({
    name       = string
    admin_user = string
    admins     = list(string)
    editors    = list(string)
    viewers    = list(string)
  }))
}

variable "create_team" {
  description = "Whether to create teams"
  type        = bool
  default     = true
}

variable "teams" {
  description = "List of teams to create"
  type = list(object({
    name    = string
    email   = string
    members = list(string)
    preferences = object({
      theme    = string
      timezone = string
    })
  }))
}
