# id: flow.try.external-exit-code
# rule: flow.try.external
# expect: output
# ---
# 3
# ---
try { ^$nu.current-exe --no-config-file -c 'exit 3' | lines } catch {|e| $e.exit_code }
