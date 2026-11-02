# id: scripts.run.main-flag-book
# rule: scripts.run.main
# expect: output
# ---
# [">>> a", ">>> b"]
# ---
[a b] | run prefix.nu --prefix ">>>" | to nuon
