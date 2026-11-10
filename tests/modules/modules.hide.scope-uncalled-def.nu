# id: modules.hide.scope-uncalled-def
# rule: modules.hide.scope
# expect: output
# ---
# 1
# ---
def nu-conformance-f [] { 1 }
def g [] { hide nu-conformance-f }
nu-conformance-f
