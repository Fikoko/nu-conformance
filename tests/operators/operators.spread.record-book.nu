# id: operators.spread.record-book
# rule: operators.spread.record
# expect: output
# ---
# {path: /tmp, limit: 5, users: [alice, bob], url: "example.com"}
# ---
let settings = { path: /tmp, limit: 5 }
{ ...$settings, users: [alice bob], ...{ url: example.com } } | to nuon
