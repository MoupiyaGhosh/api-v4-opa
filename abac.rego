package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  check = data.check_configurations[_]
  check.checkType.id = "url-v2"
}
