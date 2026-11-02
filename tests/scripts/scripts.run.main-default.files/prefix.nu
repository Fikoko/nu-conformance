def main [--prefix: string = ">"] {
  each {|line| $"($prefix) ($line)" }
}
