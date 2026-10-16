# id: commands.doc.blank-line-breaks
# rule: commands.doc.comments
# expect: output
# ---
# ""
# ---
null
# Not docs, a blank line follows

def other [] { 1 }
scope commands | where name == other | get 0.description | to nuon
