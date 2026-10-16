# id: commands.doc.single-line
# rule: commands.doc.comments
# expect: output
# ---
# {description: "Only one line", extra_description: ""}
# ---
null
# Only one line
def one [] { 1 }
scope commands | where name == one | get 0 | select description extra_description | to nuon
