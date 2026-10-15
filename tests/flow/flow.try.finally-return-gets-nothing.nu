# id: flow.try.finally-return-gets-nothing
# rule: flow.try.finally
# expect: output
# ---
# nothing
# 1
# ---
def f [] { try { return 1 } finally {|v| print ($v | describe) } }
f
