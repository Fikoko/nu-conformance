# id: flow.return.bare-guide
# rule: flow.return.early
# expect: output
# ---
# nothing
# ---
def f [] { return }
f | describe
