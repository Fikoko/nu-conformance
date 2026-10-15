# id: flow.try.finally-return-book
# rule: flow.try.finally
# expect: output
# ---
# cleaning up
# 42
# ---
def get-answer [] {
  try {
    return 42
  } finally {
    print 'cleaning up'
  }
}

get-answer
