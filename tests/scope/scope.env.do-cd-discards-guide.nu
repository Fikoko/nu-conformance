# id: scope.env.do-cd-discards-guide
# rule: scope.env.discarded
# expect: output
# ---
# true
# ---
mkdir sub
let start = (pwd)
do { cd sub }
(pwd) == $start
