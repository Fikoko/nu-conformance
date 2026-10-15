# id: flow.match.block-arm-guide
# rule: flow.match.arms
# expect: output
# ---
# 3 doubled is 6
# ---
match 3 {
  1 => 'one'
  2 => 'two'
  $n => {
    let doubled = $n * 2
    $"($n) doubled is ($doubled)"
  }
}
