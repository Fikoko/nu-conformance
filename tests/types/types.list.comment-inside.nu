# id: types.list.comment-inside
# rule: types.list.separators
# expect: output
# ---
# [1, 2, 3]
# ---
[1 2 # comment
3] | to nuon
