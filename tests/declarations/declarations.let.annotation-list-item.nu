# id: declarations.let.annotation-list-item
# rule: declarations.let.annotation-items
# expect: runtime-error
# error: nu::shell::type_mismatch
let x: list<int> = [1 "a"]
