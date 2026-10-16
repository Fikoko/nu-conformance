# id: pipelines.let.middle-book
# rule: pipelines.let
# expect: output
# ---
# 5
# hello
# ---
"hello" | let msg | str length | print
$msg
