class Piece
    attr_accessor :moveset, :x, :y, :icon, :possible_moves, :color

    def initialize(position, is_white)
        @x = position[0]
        @y = position[1]
        @possible_moves = []
        @color = is_white ? 'white' : 'black'
    end
    
    def on_board?(x, y)
        return x.between?(0, 7) && y.between?(0, 7)
    end

    def find_possible_moves(pos)
        @possible_moves = []
        @moveset.each do 
            |move|
            x = @x + move[0]
            y = @y + move[1]

            loop do 
                break if !on_board?(x, y)
                @possible_moves << [x, y] if pos[x][y].nil? || pos[x][y].color != @color
                break if !pos[x][y].nil?
                x += move[0]
                y += move[1]
            end
        end
    end

end

pc = Piece.new([2, 1], false)
p pc.on_board?(7, 1)