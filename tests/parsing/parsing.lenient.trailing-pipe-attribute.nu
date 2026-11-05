# id: parsing.lenient.trailing-pipe-attribute
# rule: parsing.lenient.trailing-pipe
# expect: runtime-error
# error: nu::shell::external_command
ls | length |
@category test

def bar [] {}
