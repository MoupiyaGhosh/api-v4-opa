package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  checkType = data.check_configurations[_].checkType
  checkType.name == "url-v2"
}
