# id: types.int.hex-wraps-negative
# rule: types.int.radix-range
# expect: output
# ---
# -9223372036854775808
# ---
0x8000000000000000 | to nuon
