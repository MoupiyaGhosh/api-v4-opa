package check.authz

default allow = false


allow {
  input.method = "GET"
  input.path = ["checks"]
  token := io.jwt.decode(input.subject.jwt)
  check = data.check_configurations[_]
  check.interval = data[token[1].asm.customer_guid].intervals[_]
  check.checkTypeId = data[token[1].asm.customer_guid].check_types[_]
}
