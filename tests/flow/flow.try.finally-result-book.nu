# id: flow.try.finally-result-book
# rule: flow.try.finally
# expect: output
# ---
# finally got: result
# result
# ---
try { 'result' } finally {|v| print $"finally got: ($v)" }
