class Node
    attr_accessor :data, :left, :right
    def initialize(data = nil, left = nil, right = nil)
        @data = data
        @left = left
        @right = right
    end
end
class BST
    attr_accessor :root, :data
    def initialize(array)
        @data = array.sort.uniq
        @root = build_tree(@data)
    end

    def build_tree(arr)
        # creates balanced bst of Node objects
        return nil if arr.empty?

        mid = (arr.size - 1) / 2
        root = Node.new(arr[mid])
        root.left = build_tree(arr[0...mid])
        root.right = build_tree(arr[(mid+1)..-1])
        return root
    end

    def insert(data, node = @root)
        
        return nil if data == node.data
        if data < node.data 
            node.left.nil? ? node.left = Node.new(data) : insert(data, node.left)
        else
            node.right.nil? ? node.right = Node.new(data) : insert(data, node.right)
        end

    end

    def delete(data, node = @root)

        return node if node.nil?

        if data < node.data
            node.left = delete(data, node.left)
        elsif data > node.data
            node.right = delete(data, node.right)
        else
            return node.right if node.left.nil?
            return node.left if node.right.nil?

            leftmost_node = leftmost(node.right)
            node.data = leftmost_node.data
            node.right = delete(leftmost_node.data, node.right)
        end
        node 

    end

    def leftmost(node)
        node = node.left until node.left.nil?
        node
    end

    def rightmost(node)
        node = node.right until node.right.nil?
        node
    end

    def find(data, node = @root)

        return node if node.nil? || data == node.data
        data < node.data ? find(data, node.left) : find(data, node.right)

    end

    def level_order()

    end

    def preorder(node = @root)

        return if node.nil?
        puts "#{node.data} "
        preorder(node.left)
        preorder(node.right)

    end

    def inorder(node = @root)

        return if node.nil?
        inorder(node.left)
        puts "#{node.data} "
        inorder(node.right)

    end

    def postorder(node = @root)

        return if node.nil?
        postorder(node.left)
        postorder(node.right)
        puts "#{node.data} "

    end

    def height()

    end

    def depth()

    end

    def balanced?()

    end

    def rebalance()

    end

    def pretty_print(node = root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end

end

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