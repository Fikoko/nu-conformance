# id: scripts.run.isolation-variable
# rule: scripts.run.isolation
# expect: parse-error
# error: nu::parser::variable_not_found
# status: pending
run v.nu | ignore
$secret
