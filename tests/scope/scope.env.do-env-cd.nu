# id: scope.env.do-env-cd
# rule: scope.env.kept
# expect: output
# ---
# sub
# ---
mkdir sub
do --env { cd sub }
pwd | path basename
