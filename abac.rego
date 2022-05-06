package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  check = data.check_configurations[_]
  tag = check.tags[_]
  tag.tag.name == input.path
}
