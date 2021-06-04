resource "grafana_user" "users" {
  count = var.create_user ? length(var.users) : 0

  email    = lookup(var.users[count.index], "email", null)
  name     = lookup(var.users[count.index], "name", "")
  login    = lookup(var.users[count.index], "login", "")
  password = lookup(var.users[count.index], "password", null)
  is_admin = lookup(var.users[count.index], "is_admin", false)
}

resource "grafana_organization" "organizations" {
  count = var.create_org ? length(var.orgs) : 0

  name         = lookup(var.users[count.index], "name", null)
  admin_user   = lookup(var.users[count.index], "admin_user", "")
  create_users = true
  admins       = lookup(var.users[count.index], "admins", [])
  editors      = lookup(var.users[count.index], "editors", [])
  viewers      = lookup(var.users[count.index], "viewers", [])
}

resource "grafana_team" "teams" {
  count = var.create_team ? length(var.teams) : 0

  name    = lookup(var.teams[count.index], "name", null)
  email   = lookup(var.teams[count.index], "email", "")
  members = lookup(var.teams[count.index], "members", [])

  depends_on = [grafana_user.users]
}

resource "grafana_team_preferences" "team_preferences" {
  count = var.create_team ? length(var.teams) : 0

  team_id  = grafana_team.teams[count.index].id
  theme    = lookup(var.teams[count.index].preferences, "theme", "")
  timezone = lookup(var.teams[count.index].preferences, "timezone", "")
  # home_dashboard_id = grafana_dashboard.metrics.dashboard_id
}
