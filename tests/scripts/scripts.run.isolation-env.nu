# id: scripts.run.isolation-env
# rule: scripts.run.isolation
# expect: output
# ---
# nothing
# ---
run e.nu | ignore
$env.R? | describe
