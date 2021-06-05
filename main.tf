resource "grafana_user" "users" {
  for_each = var.users

  email    = lookup(each.value, "email", null)
  name     = lookup(each.value, "name", "")
  login    = lookup(each.value, "login", "")
  password = lookup(each.value, "password", null)
  is_admin = lookup(each.value, "is_admin", false)
}

resource "grafana_team" "teams" {
  for_each = var.teams

  name    = lookup(each.value, "name", null)
  email   = lookup(each.value, "email", "")
  members = lookup(each.value, "members", [])

  depends_on = [grafana_user.users]
}

resource "grafana_team_preferences" "team_preferences" {
  for_each = var.teams

  team_id  = grafana_team.teams[each.key].id
  theme    = lookup(each.value["preferences"], "theme", "")
  timezone = lookup(each.value["preferences"], "timezone", "")

  depends_on = [grafana_team.teams]
}
