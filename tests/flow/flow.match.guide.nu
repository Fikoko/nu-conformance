# id: flow.match.guide
# rule: flow.match.arms
# expect: output
# ---
# [small, medium, large, negative]
# ---
[1 5 12 -3] | each {|n|
  match $n {
    1 | 2 | 3 => 'small'
    4..10 => 'medium'
    $x if $x < 0 => 'negative'
    _ => 'large'
  }
} | to nuon
