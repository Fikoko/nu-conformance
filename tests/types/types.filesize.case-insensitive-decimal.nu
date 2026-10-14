# id: types.filesize.case-insensitive-decimal
# rule: types.filesize.case-insensitive
# expect: output
# ---
# [1000b, 1000b, 1b]
# ---
[1KB 1kb 1b] | to nuon
