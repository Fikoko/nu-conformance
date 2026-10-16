# id: pipelines.external.pipefail-guide
# rule: pipelines.external.failure
# expect: output
# ---
# 3
# ---
def --wrapped fail [...rest] { ^$nu.current-exe --no-config-file -c 'exit 3' ...$rest }
try { fail | lines } catch {|e| $e.exit_code }
