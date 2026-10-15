# id: flow.try.error-text-fields-are-strings
# rule: flow.try.error-record-text
# expect: output
# ---
# [string, string]
# ---
try { 1 / 0 } catch {|e| [($e.debug | describe) ($e.rendered | describe)] } | to nuon
