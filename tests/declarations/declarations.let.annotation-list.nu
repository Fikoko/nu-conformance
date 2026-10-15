# id: declarations.let.annotation-list
# rule: declarations.let.annotation
# expect: output
# ---
# list<int>
# ---
let x: list<int> = [1 2]
$x | describe
