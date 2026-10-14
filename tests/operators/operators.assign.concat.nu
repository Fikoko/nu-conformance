# id: operators.assign.concat
# rule: operators.assign.compound
# expect: output
# ---
# [[1, 2], ab, ab]
# ---
mut l = [1]
$l ++= [2]
mut s = "a"
$s ++= "b"
mut t = "a"
$t += "b"
[$l $s $t] | to nuon
