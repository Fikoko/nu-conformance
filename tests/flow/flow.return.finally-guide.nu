# id: flow.return.finally-guide
# rule: flow.return.finally
# expect: output
# ---
# finally ran
# 1
# ---
def f [] { try { return 1 } finally { print "finally ran" }; 2 }
f
