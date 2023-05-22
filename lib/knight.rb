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
        to_print = @graph.find_path(@target)
        string_path = ''
        for i in 0..(to_print.length-2)
            string_path += to_print[i].to_s
            string_path += " -> "
        end
        string_path += to_print[-1].to_s
        puts "To get from #{@current} to #{@target} it takes #{to_print.length-1} moves"
        puts "Those moves are " + string_path
    end
end

test = Knight.new([0, 0], [7, 7])
test.calculate_positions
test.print_path