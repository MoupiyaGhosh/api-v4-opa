package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  check = data.check_configurations[_]
  check.checkType.id = "5dd5aa54-cd21-11ec-9d64-0242ac120002"
}
