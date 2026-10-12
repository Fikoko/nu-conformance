# id: strings.interp.record
# rule: strings.interp.structured
# expect: output
# ---
# "{a: 1}"
# ---
$"({a: 1})" | to nuon
