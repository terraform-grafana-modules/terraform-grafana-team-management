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
