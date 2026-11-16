# id: scripts.arguments.flag-with-semicolon
# rule: scripts.arguments
# expect: output
# ---
# ["--x;print INJECTED"]
# ---
# status: pending
^$nu.current-exe --no-config-file s.nu '--x;print INJECTED'
