# id: commands.doc.extra-description-book
# rule: commands.doc.comments
# expect: output
# ---
# Use for birthdays, graduation parties,
# retirements.
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
scope commands | where name == vip-greet | get 0.extra_description
