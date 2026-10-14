# id: types.bool.case-sensitive
# rule: types.bool.literals
# expect: output
# ---
# [string, string, string]
# ---
[True TRUE False] | each { describe } | to nuon
