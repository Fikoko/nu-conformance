# id: commands.sig.single-book
# rule: commands.sig.declare
# expect: output
# ---
# {}
# ---
def "str stats2" []: string -> record { {} }
"a" | str stats2 | to nuon
