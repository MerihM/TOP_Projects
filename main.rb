require_relative 'lib/linked_list'

line = '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
test = LinkedList.new

puts line
puts ""
puts "Populating list with append, prepend and insert_at, then printing values with to_s method."
puts "insert_at will add element to the index 4"
puts ""
puts line
puts ""
test.prepend(321)
test.append(1)
test.append(7)
test.append(2)
test.append(3)
test.append(4)
test.prepend(9)
test.prepend(24)
test.insert_at(12, 4)
puts test.to_s
puts ""
puts line
puts ""
puts "Removing element with pop, shift and remove_at. remove_at will remove element with index 2"
puts ""
puts line
puts ""
test.pop
test.shift
test.remove_at(2)
puts test.to_s
puts ""
puts line
puts ""
puts "Printing out values of head and tail node"
puts ""
puts line
puts ""
puts "Value of head node: #{test.head.value}"
puts "Value of tail node: #{test.tail.value}"
puts ""
puts line
puts ""
puts "Checking if list contains values 321 and 1023"
puts ""
puts line
puts ""
puts "Does list contain value 321? #{test.contains?(321)}"
puts "Does list contain value 1023? #{test.contains?(1023)}"
puts ""
puts line
puts ""
puts "Printing index of value 321"
puts ""
puts line
puts ""
puts test.find(321)
puts ""
puts line