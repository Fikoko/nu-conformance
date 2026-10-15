# id: scope.block.shadow-guide
# rule: scope.block.local
# expect: output
# ---
# inside: 2
# outside: 1
# ---
let x = 1
if true {
  let x = 2
  print $"inside: ($x)"
}
print $"outside: ($x)"
