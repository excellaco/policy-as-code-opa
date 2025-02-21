package infrastructure.access_control

# Access control rules for services
allow {
    input.user_role == "admin"
    input.resource == "db"
    input.action == "read"
}

allow {
    input.user_role == "admin"
    input.resource == "db"
    input.action == "write"
}

deny {
    input.user_role == "guest"
    input.resource == "db"
}
