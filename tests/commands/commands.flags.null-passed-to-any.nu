# id: commands.flags.null-passed-to-any
# rule: commands.flags.null
# expect: output
# ---
# nothing
# ---
def f [--age: any = 5] { $age | describe }
f --age=null
