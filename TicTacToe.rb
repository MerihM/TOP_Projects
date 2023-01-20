require './GridWithSymbols.rb'

module TicTacToe
    class << self
        private
            @@pos = 0
            @@array_symbols = Array.new(3) {Array.new()}
        public
        def newGame
            Grid.clearGrid
        end
        def addSymbol(x, y, s)
            Grid.ttt(x, y, s)
        end
        def selectPosition
            puts 'Select position from 1 to 9'
            @@pos = gets.chomp
            until @@pos.to_i.between?(1, 9)
                puts "Wrong selection!!!\nSelect again"
                @@pos = gets.chomp
            end
        end
    end
end

TicTacToe.selectPosition