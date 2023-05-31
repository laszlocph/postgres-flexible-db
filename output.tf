output "user_password" {
  value = postgresql_role.app_user.password
}

output "user" {
  value = postgresql_role.app_user.name
}

output "dbname" {
  value = postgresql_role.app_user.name
}


