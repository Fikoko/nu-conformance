# id: commands.wrapped.check-flag-book
# rule: commands.wrapped.rest
# expect: output
# ---
# [grid, long]
# ---
def --wrapped ezal [...rest] {
  if '-G' in $rest { 'grid' } else { 'long' }
}
[(ezal -G commands) (ezal commands)] | to nuon
