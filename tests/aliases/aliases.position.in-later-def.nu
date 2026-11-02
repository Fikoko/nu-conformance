# id: aliases.position.in-later-def
# rule: aliases.position
# expect: output
# ---
# hi
# ---
alias q = echo hi
def f [] { q }
f
