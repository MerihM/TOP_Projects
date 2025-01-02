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
        if pos_ctr == 6 
            puts "That column is full!!!"
            return
        end

        5.downto(0) do 
            |i|
            if board_arr[i][position] == 'i'
                board_arr[i][position] = token 
                break
            end
        end
        board_arr
    end

    def print_board
        line_ver = "|       |       |       |       |       |       |       |\n" 
        line_hor = "_________________________________________________________\n" 
        big_string = line_hor + line_ver
        
        board_arr.each do 
            |arr|
            for i in 0..6 do
                big_string += "|   #{arr[i]}   " 
            end
            big_string += "|\n"
            big_string += line_ver 
            big_string += line_hor 
            big_string += line_ver 
        end
        puts big_string.chomp!(line_ver)
    end
end