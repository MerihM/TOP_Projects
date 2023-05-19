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

    def insert()

    end

    def delete()

    end

    def find()

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

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

end

bst = BST.new(Array.new(15){rand(1..100)})
puts "Preorder: "
bst.preorder
puts "Inorder: "
bst.inorder
puts "Postorder: "
bst.postorder