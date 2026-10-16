# id: commands.sig.closure-parameter-guide
# rule: commands.sig.flags
# expect: output
# ---
# list<int>
# ---
do {|nums : list<int>| $nums | describe} [ 1 2 3 ]
