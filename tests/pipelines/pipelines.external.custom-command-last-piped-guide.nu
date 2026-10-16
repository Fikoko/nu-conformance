# id: pipelines.external.custom-command-last-piped-guide
# rule: pipelines.external.block
# expect: output
# ---
# a
# captured: B
# ---
def say [w] { ^$nu.current-exe --no-config-file -c $"print ($w)" }
def custom-cmd [] { say a; say b }
let r = (custom-cmd | str uppercase)
print $"captured: ($r | str trim)"
