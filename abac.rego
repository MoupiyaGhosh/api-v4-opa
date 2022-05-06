package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  checkType = data.check_configurations[_].interval
  checkType == 2
}
