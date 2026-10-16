# id: pipelines.in.custom-command-book
# rule: pipelines.in.block
# expect: output
# ---
# true
# ---
def echo_me [] {
  print $in
}
true | echo_me
