# id: commands.attr.example-book
# rule: commands.attr.example
# expect: output
# ---
# [[description, example, result]; ["Greet a VIP", "vip-greet \"Bob\"", "hi Bob"]]
# ---
null
@example "Greet a VIP" {vip-greet "Bob"} --result "hi Bob"
def vip-greet [vip: string] { $"hi ($vip)" }
scope commands | where name == vip-greet | get 0.examples | to nuon
