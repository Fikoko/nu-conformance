# id: commands.shadow.percent-custom-book
# rule: commands.shadow.builtin
# expect: parse-error
# error: nu::parser::error
def greet [] { "hi" }
%greet
