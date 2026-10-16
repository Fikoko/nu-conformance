# id: pipelines.semicolon.book
# rule: pipelines.statements
# expect: output
# ---
# HELLO
# ---
ls; "hello" | str uppercase
