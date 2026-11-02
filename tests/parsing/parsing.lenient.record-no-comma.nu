# id: parsing.lenient.record-no-comma
# rule: parsing.lenient.commas
# expect: output
# ---
# {a: 1, b: 2}
# ---
{a: 1 b: 2} | to nuon
