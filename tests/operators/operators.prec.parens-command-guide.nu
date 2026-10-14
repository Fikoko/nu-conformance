# id: operators.prec.parens-command-guide
# rule: operators.parens
# expect: output
# ---
# {a: 3, b: 2}
# ---
{ a: ('aaa' | str length), b: 2 } | to nuon
