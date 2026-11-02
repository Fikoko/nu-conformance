# id: scripts.run.plain-in-pipeline-book
# rule: scripts.run.plain
# expect: output
# ---
# helloNushell
# ---
"Hello Nushell!" | run shout.nu | str camel-case
