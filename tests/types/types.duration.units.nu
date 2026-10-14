# id: types.duration.units
# rule: types.duration.units
# expect: output
# ---
# [1ns, 1000ns, 1000000ns, 1000000000ns, 60000000000ns, 3600000000000ns, 86400000000000ns, 604800000000000ns]
# ---
[1ns 1us 1ms 1sec 1min 1hr 1day 1wk] | to nuon
