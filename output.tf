output "user_password" {
  value = postgresql_role.app_user.password
  sensitive = true
}
