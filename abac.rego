package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  check = test.check_configurations[_]
  check.interval = data.intervals[_]
}
