# id: scripts.arguments.unbalanced-paren
# rule: scripts.arguments
# expect: output
# ---
# ["a)"]
# ---
# status: pending
^$nu.current-exe --no-config-file s.nu 'a)'
