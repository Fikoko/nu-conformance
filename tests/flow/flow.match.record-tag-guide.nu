# id: flow.match.record-tag-guide
# rule: flow.match.records
# expect: output
# ---
# ["click at 10,20", quit, "unhandled resize"]
# ---
let events = [
  {type: click, x: 10, y: 20}
  {type: key, key: 'q'}
  {type: resize}
]
$events | each {|e|
  match $e {
    {type: click, x: $x, y: $y} => $"click at ($x),($y)"
    {type: key, key: 'q'} => 'quit'
    {type: $t} => $"unhandled ($t)"
  }
} | to nuon
