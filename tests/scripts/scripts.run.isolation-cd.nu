# id: scripts.run.isolation-cd
# rule: scripts.run.isolation
# expect: output
# ---
# true
# ---
let before = pwd
run e.nu | ignore
(pwd) == $before
