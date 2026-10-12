# id: strings.interp.single-quoted-form
# rule: strings.interp.expr
# expect: output
# ---
# "Captain 2"
# ---
$'Captain (1 + 1)' | to nuon
