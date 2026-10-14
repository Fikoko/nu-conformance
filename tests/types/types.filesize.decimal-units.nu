# id: types.filesize.decimal-units
# rule: types.filesize.decimal-units
# expect: output
# ---
# [1b, 1000b, 1000000b, 1000000000b, 1000000000000b, 1000000000000000b, 1000000000000000000b]
# ---
[1B 1kB 1MB 1GB 1TB 1PB 1EB] | to nuon
