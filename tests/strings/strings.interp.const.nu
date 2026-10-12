# id: strings.interp.const
# rule: strings.interp.const
# expect: output
# ---
# "2.0 kB"
# ---
const x = $"(2kb)"
$x | to nuon
