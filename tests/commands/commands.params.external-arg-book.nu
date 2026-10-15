# id: commands.params.external-arg-book
# rule: commands.params.types
# expect: output
# ---
# [1, "0001"]
# ---
def as-any [value] { $value }
def as-external [value: external_arg] { $value }
[(as-any 0001) (as-external 0001)] | to nuon
