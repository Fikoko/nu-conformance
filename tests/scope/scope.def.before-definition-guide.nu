# id: scope.def.before-definition-guide
# rule: scope.def.visibility
# expect: output
# ---
# defined later
# ---
print (greet); def greet [] { 'defined later' }
