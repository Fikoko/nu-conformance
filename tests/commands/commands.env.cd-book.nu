# id: commands.env.cd-book
# rule: commands.env.def-env
# expect: output
# ---
# sub
# ---
mkdir sub
def --env go-sub [] {
  cd sub
}
go-sub
pwd | path basename
