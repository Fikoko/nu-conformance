# id: strings.interp.error-propagates
# rule: strings.interp.errors
# expect: runtime-error
# error: nu::shell::error
$"(error make {msg: boom})"
