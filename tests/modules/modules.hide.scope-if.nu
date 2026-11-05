# id: modules.hide.scope-if
# rule: modules.hide.scope
# expect: output
# ---
# 1
# ---
# status: pending
def nu-conformance-f [] { 1 }
if true { hide nu-conformance-f }
nu-conformance-f
