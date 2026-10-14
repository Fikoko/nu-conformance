# id: types.record.describe
# rule: types.record.literal
# expect: output
# ---
# record<a: int, b: string>
# ---
{a: 1, b: "x"} | describe
