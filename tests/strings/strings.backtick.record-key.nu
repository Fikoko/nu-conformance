# id: strings.backtick.record-key
# rule: strings.backtick.syntax
# expect: output
# ---
# {"a b": 1}
# ---
{`a b`: 1} | to nuon
