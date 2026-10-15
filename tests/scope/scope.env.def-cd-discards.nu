# id: scope.env.def-cd-discards
# rule: scope.env.discarded
# expect: output
# ---
# true
# ---
mkdir sub
def go [] { cd sub }
let start = (pwd)
go
(pwd) == $start
