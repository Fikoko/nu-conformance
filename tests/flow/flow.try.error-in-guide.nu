# id: flow.try.error-in-guide
# rule: flow.try.error-record
# expect: output
# ---
# {msg: "disk full", help: "free some space"}
# ---
try { error make {msg: "disk full", help: "free some space"} } catch { $in.details | select msg help } | to nuon
