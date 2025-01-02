class GraphNode
    attr_accessor :value, :adjacent_nodes, :path_from_start
    def initialize(value)
        @value = value
        @adjacent_nodes = []
        @path_from_start = []
    end

    def add_edge(node)
        @adjacent_nodes << node
    end

    def add_to_path(value)
        @path_from_start << value
    end

    def concat_to_path(value_array)
        @path_from_start.concat(value_array)
    end

end

class Graph
    attr_reader :nodes    
    def initialize
        @nodes = []
    end

    def add_node (node)
        node.class != GraphNode ? @nodes << GraphNode.new(node) : @nodes << node
        @nodes[-1].add_to_path(@nodes[-1].value)
    end

    def add_children(parent, arr_of_children)
        @nodes.each do 
            |node|
            if node.value == parent
                arr_of_children.each do
                    |child|
                    n_child = GraphNode.new(child)
                    n_child.concat_to_path(node.path_from_start)
                    add_node(n_child)
                    node.add_edge(@nodes[-1])
                end
            end
        end
    end

    def find_path(node)
        @nodes.each {|n| return n.path_from_start if n.value == node}
    end

end