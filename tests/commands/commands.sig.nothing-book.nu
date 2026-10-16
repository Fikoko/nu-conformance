# id: commands.sig.nothing-book
# rule: commands.sig.declare
# expect: output
# ---
# nothing
# ---
def xhide [module: string, members?]: nothing -> nothing { }
xhide a | describe
