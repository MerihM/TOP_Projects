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
        # creates balanced bst
        return nil if arr.empty?

        mid = (arr.size - 1) / 2
        root = Node.new(arr[mid])
        root.left = build_tree(arr[0...mid])
        root.right = build_tree(arr[(mid+1)..-1])
        return root
    end

    def insert(data, node = @root)
        
        # inserts data in bst
        return nil if data == node.data
        if data < node.data 
            node.left.nil? ? node.left = Node.new(data) : insert(data, node.left)
        else
            node.right.nil? ? node.right = Node.new(data) : insert(data, node.right)
        end

    end

    def delete(data, node = @root)

        # deletes data from bst
        return node if node.nil?

        # if node has no children
        if data < node.data
            node.left = delete(data, node.left)
        elsif data > node.data
            node.right = delete(data, node.right)
        else
        # if node has one child
            return node.right if node.left.nil?
            return node.left if node.right.nil?

        # if node has two childs
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

    def level_order(node = @root)

        # level order iterative method
        puts "#{node.data}"
        queue = []
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?

        while !queue.empty?
            puts "#{queue[0].data}"
            queue << queue[0].left unless queue[0].left.nil?
            queue << queue[0].right unless queue[0].right.nil?
            queue.shift
        end    
    end

    def preorder(node = @root)
        # Preorder traversal of the bst
        return if node.nil?
        puts "#{node.data} "
        preorder(node.left)
        preorder(node.right)

    end

    def inorder(node = @root)
        # Inorder traversal of the bst
        return if node.nil?
        inorder(node.left)
        puts "#{node.data} "
        inorder(node.right)

    end

    def postorder(node = @root)
        # Postorder traversal of the bst
        return if node.nil?
        postorder(node.left)
        postorder(node.right)
        puts "#{node.data} "

    end

    def height(node = @root)
        # Height of the bst, height represents number of edges form root to lowest leaf
        return -1 if node.nil?
        [height(node.left), height(node.right)].max + 1

    end

    def depth(node = @root, parent = @root, edges = 0)

        return edges if parent == node 
        return -1 if parent.nil?

        if node.data < parent.data
            edges +=1
            depth(node, parent.left, edges)
        else node.data > parent.data
            edges += 1
            depth(node, parent.right, edges)
        end
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

    def depth_test(node = @root)

        # level order iterative method
        puts "#{node.data} root node"
        queue = []
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?

        while !queue.empty?
            puts "#{queue[0].data} is at depth #{depth(queue[0])}"
            queue << queue[0].left unless queue[0].left.nil?
            queue << queue[0].right unless queue[0].right.nil?
            queue.shift
        end    
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
puts "Level order "
bst.level_order
puts "Height of the tree"
puts bst.height
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Printing out depths of nodes"
bst.depth_test