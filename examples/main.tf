provider "grafana" {
  # Please, use environment variables to configure Grafana provider access:
  # GRAFANA_URL
  # GRAFANA_AUTH
}

module "team-management" {
  source = "../"

  users = [
    {
      email    = "admin-name@example.com",
      name     = "Admin Name",
      login    = "admin-name",
      password = "password",
      is_admin = true
    },
    {
      email    = "staff-name@example.com",
      name     = "Staff Name",
      password = "my-password",
      login    = "staff-name",
      is_admin = false
    },
    {
      email    = "editor-01@example.com",
      name     = "Editor 01",
      password = "my-password",
      login    = "editor01",
      is_admin = false
    },
    {
      email    = "editor-02@example.com",
      name     = "Editor 02",
      password = "my-password",
      login    = "editor02",
      is_admin = false
    },
    {
      email    = "viewer-01@example.com",
      name     = "Viewer 01",
      password = "my-password",
      login    = "viewer01",
      is_admin = false
    },
    {
      email    = "viewer-02@example.com",
      name     = "Viewer 02",
      password = "my-password",
      login    = "viewer02",
      is_admin = false
    },
  ]

  teams = [
    {
      name  = "My Admin Team",
      email = "my-admin-team@example.com",
      members = [
        "admin-name@example.com"
      ],
      preferences = {
        theme    = "light",
        timezone = "browser"
      }
    },
    {
      name  = "My Editors Team",
      email = "my-editors-team@example.com"
      members = [
        "editor-01@example.com",
        "editor-02@example.com"
      ],
      preferences = {
        theme    = "dark",
        timezone = "browser"
      }
    },
    {
      name  = "My Viewers Team",
      email = "my-viewers-team@example.com"
      members = [
        "staff-name@example.com",
        "viewer-01@example.com",
        "viewer-02@example.com"
      ],
      preferences = {
        theme    = "dark",
        timezone = "browser"
      }
    },
  ]
}
