# id: pipelines.external.earlier-to-terminal
# rule: pipelines.external.block
# expect: output
# ---
# x
# q: 5
# ---
def say [w] { ^$nu.current-exe --no-config-file -c $"print ($w)" }
let q = do { say x; 5 }
print $"q: ($q)"
