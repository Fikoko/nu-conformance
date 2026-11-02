# id: parsing.lenient.binary-pipe
# rule: parsing.lenient.binary-pipe
# expect: runtime-error
# error: nu::shell::external_command
0b[1|2]
