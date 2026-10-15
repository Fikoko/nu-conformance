# id: flow.try.external-not-found-book
# rule: flow.try.external
# expect: output
# ---
# a
# ---
try { ^nu-conformance-nonexisting }; print 'a'
