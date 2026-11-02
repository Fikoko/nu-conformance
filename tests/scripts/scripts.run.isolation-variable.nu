# id: scripts.run.isolation-variable
# rule: scripts.run.isolation
# expect: runtime-error
# error: nu::shell::variable_not_found
run v.nu | ignore
$secret
