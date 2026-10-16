# id: commands.doc.parameters-book
# rule: commands.doc.parameters
# expect: output
# ---
# [[parameter_name, description]; [vip, "The special guest"], [names, "The other guests"]]
# ---
null
# Greet guests along with a VIP
#
# Use for birthdays, graduation parties,
# retirements.
def vip-greet [
  vip: string        # The special guest
   ...names: string  # The other guests
] { 1 }
scope commands | where name == vip-greet | get 0.signatures | values | get 0 | where parameter_name != null | select parameter_name description | to nuon
