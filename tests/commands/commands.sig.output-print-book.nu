# id: commands.sig.output-print-book
# rule: commands.sig.output
# expect: parse-error
# error: nu::parser::output_type_mismatch
def inc []: int -> int {
  $in + 1
  print "Did it!"
}
