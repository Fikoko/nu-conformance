# id: scope.def.duplicate
# rule: scope.def.duplicate
# expect: parse-error
# error: nu::parser::duplicate_command_def
def f [] { 1 }
def f [] { 2 }
f
