require_relative './board'
class Connect
    attr_accessor :player_one_status, :player_one_token, :player_two_token, :board
    def initialize
        @player_one_status = true
        @player_one_token = 'x'
        @player_two_token = 'o'
        @board = Board.new
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
55.times{game.play_round}



















