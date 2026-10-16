# id: commands.attr.deprecated-once
# rule: commands.attr.deprecated-report
# expect: output
# ---
# 1
# ---
let r = (^$nu.current-exe --no-config-file -c "@deprecated\ndef g [] { 1 }\ng\ng" | complete)
($r.stderr | split row 'nu::parser::deprecated' | length) - 1
