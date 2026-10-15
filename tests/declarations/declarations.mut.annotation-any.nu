# id: declarations.mut.annotation-any
# rule: declarations.mut.type
# expect: output
# ---
# a
# ---
mut x: any = 1
$x = "a"
$x
