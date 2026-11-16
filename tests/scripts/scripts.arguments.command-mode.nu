# id: scripts.arguments.command-mode
# rule: scripts.arguments
# expect: output
# ---
# ["x;print INJECTED"]
# ---
^$nu.current-exe --no-config-file -c 'def main [...a] { $a | to nuon }' 'x;print INJECTED'
