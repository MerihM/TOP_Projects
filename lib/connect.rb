require_relative './board'
require 'io/console'
class Connect
    attr_accessor :player_switch, :player_one_token, :player_two_token, :board, :win
    def initialize
        @player_switch = true
        @player_one_token = 'x'
        @player_two_token = 'o'
        @board = Board.new
        @win = false
    end    

    def user_input
        system "clear"
        board.print_board
        puts "\n\t\tEnter a position on the board"
        pos = gets.chomp!.to_i
        if !pos.between?(1, 7)
            puts "Wrong input!!! Press any key to repeat input"
            STDIN.getch
            pos = user_input
        end
        pos
    end

    def play_round(position = user_input) 
        system "clear"
        @player_switch ? token = player_one_token : token = player_two_token
        if board.add_token(token, position-1) == "That column is full!!!"
            play_round
            return
        end
        board.print_board
        @player_switch = !player_switch
    end

    def check_win
        consecutive_tokens = 0
        board.board_arr.each do
            |arr|
            consecutive_tokens = horizontal_check(arr, consecutive_tokens.to_i)
            return if @win
        end
        vertical_check
        diagonal_check

    end

    def horizontal_check(arr, ctr)
        return if arr.length <= 0
        if ctr == 3
            @win = true
            return ctr
        end
        if arr[0] == arr[1] && arr[0] != "i"
            horizontal_check(arr[1..arr.length-1], ctr + 1)
        else
            horizontal_check(arr[1..arr.length-1], 0) 
        end
    end

    def vertical_check(pos = 0)
        return if @win || pos == 6
        arr_test = []
        for i in 0..5
            arr_test << board.board_arr[i][pos]
        end
        horizontal_check(arr_test, 0)
        vertical_check(pos+1)
    end

    def diagonal_check
        direction = [[-1, 1], [-1, -1]]
        direction.each do
            |dir_arr| 
            board.board_arr.each_with_index do
                |arr, index|
                arr.each_with_index do
                    |num, index_two|
                    temp_arr = []
                    i = index
                    j = index_two
                    while i.between?(0,5) && j.between?(0,6)
                        temp_arr << board.board_arr[i][j]
                        i += dir_arr[0]
                        j += dir_arr[1]
                    end
                    horizontal_check(temp_arr, 0) if temp_arr.length >= 4
                    return if @win
                end
            end
        end
    end

end


















