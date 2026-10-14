# id: types.float.special-describe
# rule: types.float.special
# expect: output
# ---
# [float, float]
# ---
[(inf | describe), (NaN | describe)] | to nuon
