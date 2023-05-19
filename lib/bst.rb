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
end