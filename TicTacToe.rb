require './GridWithSymbols.rb'

module TicTacToe
    class << self
        private
            @@pos = 0
            @@array_symbols = Array.new(3) {Array.new()}
            @@array_of_valid_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            @@posX = 0
            @@posY = 0
            @@exists = false
        public
        def newGame
            Grid.clearGrid
        end
        def addSymbol(x, y, s)
            Grid.ttt(x, y, s)
        end
        def positionAssignment(pos)
            case pos.to_i
                when 1..3
                    @@posX = 0
                when 4..6
                    @@posX = 1
                when 7..9
                    @@posX = 2
            end
            case ((pos.to_i + 3)%3)
            when 0
                @@posY = 2
            when 1
                @@posY = 0
            when 2 
                @@posY = 1
            end
            p "Position x #{@@posX}, Position y #{@@posY}"
        end
        def checkIfExists
            @@array_of_valid_positions.each_with_index do
                |val, ind|
                if val == @@pos.to_i
                    @@array_of_valid_positions[ind] = 0
                    positionAssignment(@@pos)
                    @@exists = true
                end
            end
            if !@@exists
                p 'There is already something in that position'
                selectPosition
            end
        end
        def selectPosition
            @@exists = false
            puts 'Select position'
            @@pos = gets.chomp
            until @@pos.to_i.between?(1, 9)
                puts "Select again:\n"
                @@pos = gets.chomp
            end
            checkIfExists
        end
    end
end

