class Piece
    attr_accessor :moveset, :x, :y, :icon, :possible_moves, :color

    def initialize(position, is_white)
        @x = position[0]
        @y = position[1]
        @possible_moves = []
        @color = is_white ? 'white' : 'black'
    end
    
end