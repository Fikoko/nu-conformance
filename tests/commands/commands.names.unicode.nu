# id: commands.names.unicode
# rule: commands.names.characters
# expect: output
# ---
# [ok, ok, ok]
# ---
def get-size [] { 'ok' }
def 命令 [] { 'ok' }
def mycommand123 [] { 'ok' }
[(get-size) (命令) (mycommand123)] | to nuon
