# id: flow.match.pipeline-input-guide
# rule: flow.match.value
# expect: output
# ---
# nu 0.116
# ---
{name: 'nu', version: 116} | match $in { {$name, $version} => $"($name) 0.($version)" }
