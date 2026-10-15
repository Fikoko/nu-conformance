# id: flow.try.catch-in-pipeline-book
# rule: flow.try.value
# expect: output
# ---
# An error happened! And now I am resuming.
# ---
try { 1 / 0 } catch { 'An error happened!' } | $in ++ ' And now I am resuming.'
