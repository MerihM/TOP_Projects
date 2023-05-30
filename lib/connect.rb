require_relative './board'
class Connect
    attr_accessor :player_one_status, :player_one_token, :player_two_token, :board
    def initialize
        @player_one_status = true
        @player_one_token = 'x'
        @player_two_token = 'o'
        @board = Board.new
    end    

    

end
