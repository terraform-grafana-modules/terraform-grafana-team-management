variable "users" {
  description = "List of users to create"
  type = map(object({
    email    = string
    name     = string
    login    = string
    password = string
    is_admin = bool
  }))
}

variable "teams" {
  description = "List of teams to create"
  type = map(object({
    name    = string
    email   = string
    members = list(string)
    preferences = object({
      theme    = string
      timezone = string
    })
  }))
}
