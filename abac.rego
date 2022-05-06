package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  interval = data.check_configurations[_].interval
  interval > 10
}
