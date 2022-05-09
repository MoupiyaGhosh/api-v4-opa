package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  check = data.check_configurations[_]
  check.interval = data.intervals[_]
  check.checkTypeId =  uuid.rfc4122(data.check_types[_].id)
}
