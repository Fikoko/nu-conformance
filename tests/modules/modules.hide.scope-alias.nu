# id: modules.hide.scope-alias
# rule: modules.hide.scope
# expect: output
# ---
# a
# ---
# status: pending
alias nu-conformance-a = echo a
do { hide nu-conformance-a }
nu-conformance-a
