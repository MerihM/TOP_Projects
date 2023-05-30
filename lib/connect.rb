require_relative './board'
require 'io/console'
class Connect
    attr_accessor :player_one_status, :player_one_token, :player_two_token, :board
    def initialize
        @player_one_status = true
        @player_one_token = 'x'
        @player_two_token = 'o'
        @board = Board.new
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

    def play_round(position = rand(7)) # has to take user input for position argument, rand for testing
        system "clear"
        @player_one_status ? token = player_one_token : token = player_two_token
        if board.add_token(token, position) == "That column is full!!!"
            play_round
            return
        end
        board.print_board
        @player_one_status = !player_one_status
    end

end

game = Connect.new
# 55.times{game.play_round}
p game.user_input


















