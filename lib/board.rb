class Board 
    attr_accessor :board_arr

    def initialize 
        @board_arr = Array.new(6){Array.new(7) {"i"}} 
    end

    def add_token(token, position)
        pos_ctr = 0
        for i in 0..5 do
            pos_ctr += 1 if board_arr[i][position] != 'i'
        end
        return puts "That column is full!!!" if pos_ctr == 6 

        5.downto(0) do 
            |i|
            if board_arr[i][position] == 'i'
                board_arr[i][position] = token 
                break
            end
        end
    end
end