# id: aliases.position.def-before-alias
# rule: aliases.position
# expect: runtime-error
# error: nu::shell::external_command
def f [] { nu-conformance-q }
alias nu-conformance-q = echo hi
f
