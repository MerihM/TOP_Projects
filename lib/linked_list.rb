class Node 
    attr_reader :value
    attr_accessor :next_node

    def initialize (value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def test_print
       temp = @head
       while temp != nil
        puts temp.value 
        temp = temp.next_node
       end
    end

    def append(value)
        # Add element to the end of the Linked List
        @head == nil ? @head = Node.new(value) : tail.next_node = Node.new(value)
    end

    def prepend(value)
        # Add element to the begining of the Linked list
        temp = Node.new(value)
        temp.next_node = @head
        @head = temp
    end

    def size(node = @head, ctr = 0)
        # Return number of nodes in Linked List
        return 'The list is empty!!!' if node == nil
        node.next_node == nil ? ctr + 1 : size(node.next_node, ctr+1)
    end

    def head
        # Return first node
        @head
    end

    def tail(temp = @head)
        # Return last node
        return temp if temp.next_node == nil
        tail(temp.next_node)
    end

    def at(index, ctr = 0, node = head)
        # Returns node at index
        return "ERROR! There is no node at that index" if node == nil
        index == ctr ? node.value : at(index, ctr+1, node.next_node)
    end

    def shift 
        # Removes first node 
        @head = @head.next_node
    end

    def pop(node = @head)
        # Removes last node
        return node.next_node = nil if node.next_node.next_node == nil
        pop(node.next_node) 
    end

    def contains?(value)
        # Check if Linked List contains value, if it does return true, else return false
    end

    def find(value)
        # Returns index at which node was found, if not found return nil
    end

    def to_s
        # Represent Linked List as string formated as (value) -> (value) -> ... (value) -> nil
    end

    def insert_at(value, index)
        # Insert new node with value at index
    end

    def remove_at(index)
        # Remove node from Linked List at index
    end
end

linija = '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
test = LinkedList.new

puts linija
test.prepend(321)
test.append(1)
test.append(7)
test.append(2)
test.append(3)
test.append(4)
test.prepend(9)
test.prepend(24)

test.test_print

puts linija

test.pop

test.test_print
puts linija

test.shift

test.test_print

puts linija

p test.size
