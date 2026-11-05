# id: scripts.source.again-after-block
# rule: scripts.source.nested
# expect: output
# ---
# zz
# ---
# status: pending
do { source zz.nu }
source zz.nu
zzhelper
