require_relative "./graph"
class Knight

    attr_accessor :current, :target, :garph, :valid_moves, :calculated_positions, :queue


    def initialize(current = [0, 0], target = [0, 0])
        @current = current
        @target = target
        @graph = Graph.new()
        @graph.add_node(@current)
        @moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
        @calculated_positions = [current]
        @queue = [current]
    end

    def calculate_positions
        until @queue.empty?
            temp_arr = []
            @moves.each do 
                |move|
                
                x = move[0]+@queue[0][0]
                y = move[1]+@queue[0][1]
                if (x.between?(0, 7) && y.between?(0, 7)) && !(@calculated_positions.include?([x, y]))
                    @queue << [x, y] 
                    @calculated_positions << [x, y]
                    temp_arr << [x, y]
                end
            end
            @graph.add_children(@queue[0], temp_arr)
            @queue.shift
        end
    end

    def print_path
        @graph.find_path(@target)
    end
end

test = Knight.new([1, 1], [2, 3])
test.calculate_positions
p test.calculated_positions