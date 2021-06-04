provider "grafana" {
  # Please, use environment variables to configure Grafana provider access:
  # GRAFANA_URL
  # GRAFANA_AUTH
}

module "team-management" {
  source = "../"

  # create_user = false
  # create_org  = false
  create_team = false

  users = [
    {
      email    = "tf-admin@example.com",
      name     = "TF Admin",
      login    = "tf-admin",
      password = "my-password",
      is_admin = true
    },
    {
      email    = "staff.name@example.com",
      name     = "Staff Name",
      password = "my-password",
      login    = "staff",
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

  orgs = [
    {
      name       = "My Organization"
      admin_user = "tf-admin"
      admins = [
        "tf-admin@example.com"
      ]
      editors = [
        "editor-01@example.com",
        "editor-02@example.com"
      ]
      viewers = [
        "viewer-01@example.com",
        "viewer-02@example.com"
      ]
    }
  ]

  teams = [
    {
      name  = "Administrators",
      email = "administrators@example.com",
      members = [
        "tf-admin@example.com"
      ],
      preferences = {
        theme    = "dark",
        timezone = "browser"
      }
    },
    {
      name  = "Viewers",
      email = "a@example.com"
      members = [
        "staff.name@example.com",
        "viewer-01@example.com"
      ],
      preferences = {
        theme    = "dark",
        timezone = "browser"
      }
    },
  ]
}
