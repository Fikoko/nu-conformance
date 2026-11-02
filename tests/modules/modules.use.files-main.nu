# id: modules.use.files-main
# rule: modules.use.files
# expect: output
# ---
# [main, sub]
# ---
use m.nu
[(m) (m sub)] | to nuon
