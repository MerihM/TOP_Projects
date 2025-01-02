require_relative "lib/bst.rb"


bst = BST.new(Array.new(15){rand(1..100)})

puts "Inorder before input: "
bst.inorder

bst.insert(332)
bst.insert(122)
bst.insert(222)
bst.insert(523)
bst.insert(732)
puts "After input: "
bst.pretty_print
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "After deletion of 523: "
bst.delete(332)
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
bst.pretty_print
puts "Level order "
bst.level_order
puts "Height of the tree"
puts bst.height
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Printing out depths of nodes"
bst.depth_test
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Checking if tree is balanced"
puts bst.balanced?
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Rebalancing tree"
bst.rebalance
bst.pretty_print