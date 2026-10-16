# id: commands.sig.output-empty-list-guide
# rule: commands.sig.output
# expect: output
# ---
# []
# ---
def f []: nothing -> list { [] }
f | to nuon
