# id: pipelines.in.stored-book
# rule: pipelines.in.block
# expect: output
# ---
#  1-Jan-2000
# ... was a Saturday
# ... was day 001 of the year
# ---
def "date info" [] {
  let day = $in
  print ($day | format date '%v')
  print $'... was a ($day | format date '%A')'
  print $'... was day ($day | format date '%j') of the year'
}

'2000-01-01' | date info
