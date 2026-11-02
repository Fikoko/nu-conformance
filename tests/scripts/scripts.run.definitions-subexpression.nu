# id: scripts.run.definitions-subexpression
# rule: scripts.run.definitions
# expect: output
# ---
# 42
# 0
# ---
print (run d.nu 21)
scope commands | where name == main | length
