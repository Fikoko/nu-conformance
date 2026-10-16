# id: pipelines.in.interpolation-guide
# rule: pipelines.in.stage
# expect: output
# ---
# hello world
# ---
"hello" | $"($in) world"
