# id: modules.hide.scope-do
# rule: modules.hide.scope
# expect: output
# ---
# 1
# ---
# status: pending
def nu-conformance-f [] { 1 }
do { hide nu-conformance-f }
nu-conformance-f
