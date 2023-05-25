class Board 
    attr_accessor :board_arr

    def initialize 
        @board_arr = Array.new(6){Array.new(7)} 
    end
end