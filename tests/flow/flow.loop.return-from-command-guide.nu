# id: flow.loop.return-from-command-guide
# rule: flow.loop.return
# expect: output
# ---
# report-3
# ---
def find-free-name [base: string, taken: list<string>] {
  mut i = 1
  loop {
    let candidate = $"($base)-($i)"
    if $candidate not-in $taken { return $candidate }
    $i += 1
  }
}
find-free-name report [report-1 report-2]
