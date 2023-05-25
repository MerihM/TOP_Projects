class Board 
    attr_accessor :board_arr

    def initialize 
        @board_arr = Array.new(6){Array.new(7) {"i"}} 
    end

    def add_token(token, position)
        5.downto(0) do 
            |i|
            if board_arr[i][position] == 'i'
                board_arr[i][position] = token 
                break
            end
        end
    end
end

brd = Board.new
brd.add_token('a', 4)
brd.add_token('x', 4)
brd.add_token('a', 4)
brd.add_token('x', 4)
brd.add_token('a', 4)
brd.add_token('x', 4)
brd.add_token('a', 4)
p brd.board_arr