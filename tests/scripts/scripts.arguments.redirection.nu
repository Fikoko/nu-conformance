# id: scripts.arguments.redirection
# rule: scripts.arguments
# expect: output
# ---
# [o>, "out.txt"]
# false
# ---
# status: pending
print (^$nu.current-exe --no-config-file s.nu 'o>' out.txt | str trim)
'out.txt' | path exists
