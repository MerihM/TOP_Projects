require_relative 'lib/linked_list'

line = '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
test = LinkedList.new

puts line

test.prepend(321)
test.append(1)
test.append(7)
test.append(2)
test.append(3)
test.append(4)
test.prepend(9)
test.prepend(24)

puts test.to_s

puts line

test.remove_at(2)

puts test.to_s
