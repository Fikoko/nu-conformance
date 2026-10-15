# id: commands.rest.double-dash-builtin-book
# rule: commands.rest.end-of-flags
# expect: output
# ---
# a-xb
# ---
[a b] | str join -- -x
