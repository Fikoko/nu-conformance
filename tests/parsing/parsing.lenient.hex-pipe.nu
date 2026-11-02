# id: parsing.lenient.hex-pipe
# rule: parsing.lenient.binary-pipe
# expect: runtime-error
# error: nu::shell::external_command
0x[1 | 2]
