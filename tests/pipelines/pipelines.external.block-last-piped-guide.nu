# id: pipelines.external.block-last-piped-guide
# rule: pipelines.external.block
# expect: output
# ---
# a
# B
# ---
def say [w] { ^$nu.current-exe --no-config-file -c $"print ($w)" }
(say a; say b) | str uppercase
