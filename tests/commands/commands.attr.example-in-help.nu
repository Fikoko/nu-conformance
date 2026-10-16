# id: commands.attr.example-in-help
# rule: commands.attr.example
# expect: output
# ---
# true
# ---
null
@example "Greet a VIP" {vip-greet "Bob"} --result "hi Bob"
def vip-greet [vip: string] { $"hi ($vip)" }
help vip-greet | str contains 'Greet a VIP'
