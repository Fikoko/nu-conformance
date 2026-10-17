# id: commands.attr.deprecated-report-every
# rule: commands.attr.deprecated-report
# expect: output
# ---
# 3
# ---
# status: pending
let r = (^$nu.current-exe --no-config-file -c "@deprecated --report every\ndef g [] { 1 }\ng\ng\ng" | complete)
($r.stderr | split row 'nu::parser::deprecated' | length) - 1
