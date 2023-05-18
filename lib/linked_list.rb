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
    end

    def prepend(value)
        # Add element to the end of the Linked list
    end

    def size
        # Return number of nodes in Linked List
    end

    def head
        # Return first node
    end

    def tail
        # Return last node
    end

    def at(index)
        # Returns node at index
    end

    def pop
        # Removes last node
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