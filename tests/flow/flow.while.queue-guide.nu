# id: flow.while.queue-guide
# rule: flow.while.condition
# expect: output
# ---
# processing a
# processing b
# processing c
# ---
mut queue = [a b c]
while not ($queue | is-empty) {
  print $"processing ($queue | first)"
  $queue = ($queue | skip 1)
}
