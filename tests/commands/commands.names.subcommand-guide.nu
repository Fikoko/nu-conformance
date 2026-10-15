# id: commands.names.subcommand-guide
# rule: commands.names.subcommands
# expect: output
# ---
# HEY
# ---
def "str shout" [] { $in | str uppercase }
'hey' | str shout
