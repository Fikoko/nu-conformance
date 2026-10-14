# id: types.nothing.case-sensitive
# rule: types.nothing.literal
# expect: output
# ---
# [nothing, string, string]
# ---
[null Null NULL] | each { describe } | to nuon
