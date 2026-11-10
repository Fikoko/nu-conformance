# id: scripts.source.again-after-block-variable
# rule: scripts.source.nested
# expect: output
# ---
# let
# ---
do { source zzlet.nu }
source zzlet.nu
$zzlet
