# id: scope.env.def-env-cd
# rule: scope.env.kept
# expect: output
# ---
# sub
# ---
mkdir sub
def --env go [] { cd sub }
go
pwd | path basename
