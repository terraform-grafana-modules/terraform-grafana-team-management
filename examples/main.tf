provider "grafana" {
  # Please, use environment variables to configure Grafana provider access:
  # GRAFANA_URL
  # GRAFANA_AUTH
}

module "team-management" {
  source = "../"

  users = {
    "admin-name" = {
      email    = "admin-name@example.com",
      name     = "Admin Name",
      login    = "admin-name",
      password = "password",
      is_admin = true
    },
    "staff-name" = {
      email    = "staff-name@example.com",
      name     = "Staff Name",
      password = "my-password",
      login    = "staff-name",
      is_admin = false
    },
    "editor01" = {
      email    = "editor-01@example.com",
      name     = "Editor 01",
      password = "my-password",
      login    = "editor01",
      is_admin = false
    },
    "editor02" = {
      email    = "editor-02@example.com",
      name     = "Editor 02",
      password = "my-password",
      login    = "editor02",
      is_admin = false
    },
    "viewer01" = {
      email    = "viewer-01@example.com",
      name     = "Viewer 01",
      password = "my-password",
      login    = "viewer01",
      is_admin = false
    },
    "viewer02" = {
      email    = "viewer-02@example.com",
      name     = "Viewer 02",
      password = "my-password",
      login    = "viewer02",
      is_admin = false
    },
  }

  teams = {
    "My Admin Team" = {
      name  = "My Admin Team",
      email = "my-admin-team@example.com",
      members = [
        "admin-name@example.com"
      ],
      preferences = {
        theme    = "light",
        timezone = "utc"
      }
    },
    "My Editors Team" = {
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
    "My Viewers Team" = {
      name  = "My Viewers Team",
      email = "my-viewers-team@example.com"
      members = [
        "staff-name@example.com",
        "viewer-01@example.com",
        "viewer-02@example.com"
      ],
      preferences = {
        theme    = "",
        timezone = "browser"
      }
    },
  }

}
