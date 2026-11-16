# id: scripts.arguments.spread-variable
# rule: scripts.arguments
# expect: output
# ---
# ["...$env.NU_CONFORMANCE"]
# ---
# status: pending
with-env {NU_CONFORMANCE: a} { ^$nu.current-exe --no-config-file s.nu '...$env.NU_CONFORMANCE' }
