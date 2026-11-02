# id: aliases.position.not-outside-block
# rule: aliases.position
# expect: runtime-error
# error: nu::shell::external_command
do { alias nu-conformance-q = echo b }
nu-conformance-q
