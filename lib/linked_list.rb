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
        index == ctr ? node : at(index, ctr+1, node.next_node)
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

    def contains?(value, condition = false, node = @head)
        # Check if Linked List contains value, if it does return true, else return false
        value == node.value ? condition = true : node = node.next_node while node.next_node != nil && condition != true
        condition
    end

    def find(value, index = 0, node = @head)
        # Returns index at which node was found, if not found return nil
        return "ERROR! Value #{value} is not contained in the list" if node == nil
        value == node.value ? "Value #{value} is at index: #{index}" : find(value, index+1, node.next_node)
    end

    def to_s(node = @head)
        # Represent Linked List as string formated as (value) -> (value) -> ... (value) -> nil
        string_list = ""
        while node != nil 
            string_list += "(#{node.value}) -> " 
            node = node.next_node
        end
        string_list += 'nil'
    end

    def insert_at(value, index)
        # Insert new node with value at index
        return "ERROR!!! Invalid index" if index > size
        return append(value) if index == size
        return prepend(value) if index == 0

        temp = Node.new(value)
        node = at(index-1)
        temp.next_node = node.next_node
        node.next_node = temp
    end

    def remove_at(index)
        # Remove node from Linked List at index
        return "ERROR!!! Invalid index" if index > size
        return pop if index == (size - 1) 
        return shift if index == 0

        node = at(index-1)
        node.next_node = node.next_node.next_node
    end
end
