# id: commands.shadow.echo-book
# rule: commands.shadow.builtin
# expect: output
# ---
# ["echo is turned off", hello]
# ---
def echo [...args] { "echo is turned off" }
[(echo hello) (%echo hello)] | to nuon
