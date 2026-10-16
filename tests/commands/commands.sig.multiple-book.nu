# id: commands.sig.multiple-book
# rule: commands.sig.declare
# expect: output
# ---
# ["", ""]
# ---
def j [separator?: string]: [
  list -> string
  string -> string
] { "" }
[(["a"] | j) ("a" | j)] | to nuon
