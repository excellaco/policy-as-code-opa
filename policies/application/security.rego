package application.security

# Allowed roles for actions
allowed_roles = {"admin", "security_manager"}

# Allow deletion by admin role
allow {
    input.method == "DELETE"
    input.resource_type == "resource"
    input.user_role == "admin"
}

# Allow creation in production environment by admin role
allow {
    input.method == "POST"
    input.resource_type == "resource"
    input.environment == "production"
    input.user_role == "admin"
}

# Deny all other requests
deny {
    not allow
}
