# id: commands.shadow.length-guide
# rule: commands.shadow.builtin
# expect: output
# ---
# ["my length", 3]
# ---
def length [] { 'my length' }
[(length) ([1 2 3] | %length)] | to nuon
