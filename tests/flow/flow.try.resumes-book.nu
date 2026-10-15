# id: flow.try.resumes-book
# rule: flow.try.value
# expect: output
# ---
# Resuming
# ---
try { error make { msg: 'Some error info' }}; print 'Resuming'
