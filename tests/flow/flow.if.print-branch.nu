# id: flow.if.print-branch
# rule: flow.if.value
# expect: output
# ---
# a
# nothing
# ---
if true { print a } else { print b } | describe
