require_relative "./graph"
class Knight

    attr_accessor :current, :target, :garph


    def initialize(current = [0, 0], target = [0, 0])
        @current = current
        @target = target
        @graph = Graph.new()
        @graph.add_node(@current)
    end

    def calculate_next_positions(current_pos)

    end

    def print_path
        @graph.find_path(@current)
    end
end

test = Knight.new([1, 1], [0, 0])
p test.print_path