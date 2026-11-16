# id: scripts.arguments.words
# rule: scripts.arguments
# expect: output
# ---
# [a, "b c"]
# ---
^$nu.current-exe --no-config-file s.nu a 'b c'
