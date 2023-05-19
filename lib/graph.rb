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

    def to_s
        puts "Value: #{@value}"
        @adjacent_nodes.each {|mem| puts "\s\sChild node of #{value}: #{mem.value}"}
    end
end

class Graph
    attr_reader :nodes    
    def initialize
        @nodes = []
    end

    def add_node (node)
        @nodes << GraphNode.new(node)
    end

    def add_children(parent, arr_of_children)
        @nodes.each do 
            |node|
            puts node.value
            if node.value == parent
                arr_of_children.each do
                    |child|
                    add_node(child)
                    node.add_edge(@nodes[-1])
                end
            end
        end
    end

    def to_s 
        @nodes.each {|mem| mem.to_s}
    end

end

test = Graph.new()
test.add_node (1)
test.add_node (2)
test.add_node (3)
test.add_children(2, [6, 7, 9])
test.to_s