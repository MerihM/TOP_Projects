require_relative "lib/graph"
require_relative "lib/knight"

line = "\n_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--_--\n\n"

puts line
test = Knight.new([0, 0], [7, 2]).find_path
puts line
test = Knight.new([1, 0], [0, 1]).find_path
puts line
test = Knight.new([0, 0], [3, 2]).find_path
puts line
test = Knight.new([5, 1], [7, 1]).find_path
puts line
test = Knight.new([3, 6], [3, 1]).find_path
puts line
test = Knight.new([7, 7], [6, 3]).find_path
puts line
test = Knight.new([6, 2], [1, 6]).find_path
puts line
test = Knight.new([2, 5], [4, 7]).find_path
puts line
test = Knight.new([4, 4], [5, 2]).find_path
puts line
test = Knight.new([7, 1], [3, 3]).find_path
