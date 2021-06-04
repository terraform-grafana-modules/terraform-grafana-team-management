# terraform-grafana-team-management
Terraform modules for teams and user management

## Requirements

| Name | Version |
|------|---------|
| grafana | 1.10.0 |

## Providers

| Name | Version |
|------|---------|
| grafana | 1.10.0 |

## Resources

| Name |
|------|
| [grafana_user](https://registry.terraform.io/providers/grafana/grafana/1.10.0/docs/resources/user) |
| [grafana_team](https://registry.terraform.io/providers/grafana/grafana/1.10.0/docs/resources/team) |
| [grafana_team_preferences](https://registry.terraform.io/providers/grafana/grafana/1.10.0/docs/resources/team_preferences) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create_user | Whether to create users | `boolean` | `true` | no |
| users | List of users to create | `list(map(any))` | n/a | yes |
| create_team | Whether to create teams | `boolean` | `true` | no |
| teams | List of teams to create | `list(map(any))` | n/a | yes |

## Outputs
