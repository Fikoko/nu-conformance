# id: commands.doc.in-help
# rule: commands.doc.comments
# expect: output
# ---
# true
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
help vip-greet | str contains 'Greet guests along with a VIP'
