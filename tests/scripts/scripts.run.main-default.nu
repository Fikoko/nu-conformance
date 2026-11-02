# id: scripts.run.main-default
# rule: scripts.run.main
# expect: output
# ---
# ["> a", "> b"]
# ---
[a b] | run prefix.nu | to nuon
