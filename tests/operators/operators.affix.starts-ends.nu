# id: operators.affix.starts-ends
# rule: operators.affix.match
# expect: output
# ---
# [true, true, false, true]
# ---
[("nushell" starts-with "nu") ("nushell" ends-with "ll") ("nushell" not-starts-with "nu") ("nushell" not-ends-with "x")] | to nuon
