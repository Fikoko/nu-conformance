# id: flow.loop.fibonacci-guide
# rule: flow.loop.repeat
# expect: output
# ---
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# ---
mut fib = [0 1]
loop {
  let next = ($fib | last 2 | math sum)
  if $next > 50 { break }
  $fib ++= [$next]
}
$fib | to nuon
