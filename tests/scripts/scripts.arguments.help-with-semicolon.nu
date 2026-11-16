# id: scripts.arguments.help-with-semicolon
# rule: scripts.arguments
# expect: output
# ---
# ["--help;print INJECTED"]
# ---
# status: pending
^$nu.current-exe --no-config-file s.nu '--help;print INJECTED'
