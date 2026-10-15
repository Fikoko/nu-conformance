# id: scope.env.if-cd-keeps-guide
# rule: scope.env.kept
# expect: output
# ---
# sub
# ---
mkdir sub
if true { cd sub }
pwd | path basename
