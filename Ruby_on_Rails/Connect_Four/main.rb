require_relative 'lib/board'
require_relative 'lib/connect'
require 'io/console'

def new_game 
    game = Connect.new
    round_count = 0
    while round_count < 42
        game.play_round
        game.check_win
        break if game.win 
        round_count+=1
        p round_count
    end
end

new_game