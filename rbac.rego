package rbac

default allow = true

allow {
    greeting_service
}
allow {
    febe_service
}
allow {
    swagger
}

swagger {
    input.resource.method == "GET"
    input.resource.path == "/swagger"
}

# Non-restricted access
greeting_service {
    input.resource.method == "GET"
    input.resource.path == "/greeting-api/hello"
}
febe_service {
    input.resource.method == "GET"
    input.resource.path == "/febe/tags"
    t := io.jwt.decode(input.api_token)
    t[1].asm_roles[_] == "CustomerCheckAdmin"
}
# Only GreeterAdmin role access
greeting_service {
    input.resource.method == "GET"
    t := io.jwt.decode(input.api_token)
    t[1].asm_roles[_] == "GreetingServiceAdmin"
}



# ---------------------- Debug ----------------------

print_input {
    print_resourse
    print_token_payload
}

print_token_payload {
    t := io.jwt.decode(input.token)
    print("customer_guid: ", t[1].asm.customer_guid)
    print("customer_id: ", t[1].asm.customer_id)
    print("customer_name: ", t[1].asm.customer_name)
    print("full_name: ", t[1].asm.full_name)
    print("permissions: ", t[1].asm.permissions)
    print("roles: ", t[1].asm.roles)
    print("silo_id: ", t[1].asm.silo_id)
    print("user_guid: ", t[1].asm.user_guid)
    print("user_id: ", t[1].asm.user_id)
    print("asm_roles: ", t[1].asm_roles)
    print("asm_user_guid: ", t[1].asm_user_guid)
    print("asm_user_id: ", t[1].asm_user_id)
    print("aud: ", t[1].aud)
    print("azp: ", t[1].azp)
    print("customer_guid: ", t[1].customer_guid)
    print("customer_id: ", t[1].customer_id)
    print("customer_name: ", t[1].customer_name)
    print("exp: ", t[1].exp)
    print("iat: ", t[1].iat)
    print("iss: ", t[1].iss)
    print("jti: ", t[1].jti)
    print("name: ", t[1].name)
    print("preferred_username: ", t[1].preferred_username)
    print("scope: ", t[1].scope)
    print("session_state: ", t[1].session_state)
    print("silo_id: ", t[1].silo_id)
    print("sub: ", t[1].sub)
    print("typ: ", t[1].typ)
    print("username: ", t[1].username)
}

print_resourse {
    print("path: ", input.resource.path)
    print("method: ", input.resource.method)
}
