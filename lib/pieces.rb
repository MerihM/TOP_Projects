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

    def find_possible_moves(position)
        @possible_moves = []
        @moveset.each do 
            |move|
            x = @x + move[0]
            y = @y + move[1]

            loop do 
                break if !on_board?(x, y)
                @possible_moves << [x, y] if position[x][y].nil? || position[x][y].color != @color
                break if !position[x][y].nil?
                x += move[0]
                y += move[1]
            end
        end
    end
end

class Pawn < Piece
    attr_accessor :has_moved, :double_stepped
    def initialize(position, is_white)
        @moveset = {
            move_forward: [1, 0],
            double_step: [2, 0],
            right_diagonal: [1, 1],
            left_diagonal: [1, -1]
        }
        @has_moved = false
        @double_stepped = false
        @icon = is_white ? '♟' : '♙'
        super
        @moveset.each_key {|move_type| @moveset[move_type][0] *= -1} if @color == 'white'
    end

    def find_possible_moves(position)
        @possible_moves = []
        @moveset.each_key do 
            |move_type|
            x = @x + @moveset[move_type][0]
            y = @y + @moveset[move_type][1]

            next unless on_board?(x, y)

            case move_type
            when :move_forward
                @possible_moves << [x, y] if position[x][y].nil?
            when :double_step
                @possible_moves << [x, y] if position[x][y].nil? && position[(x + @x)/2][y].nil? && !@has_moved
            when :right_diagonal, :left_diagonal
                @possible_moves << [x, y] if !position[x][y].nil? && position[x][y].color != @color
                en_passant(position, x, y)
            end
        end
    end

    def en_passant(position, x, y)
        if position[x][y].nil?
            if @color == 'white'
                if position[x+1][y].instance_of(Pawn) && position[x+1][y].double_stepped
                    @possible_moves << [x, y]
                end
            end
            if @color == 'black'
                if position[x-1][y].instance_of(Pawn) && position[x-1][y].double_stepped
                    @possible_moves << [x, y]
                end
            end
        end
    end
end

class Rook < Piece
    attr_accessor :has_moved

    def initialize(position, is_white)
        @moveset = [
            [0, 1],
            [0, -1],
            [1, 0],
            [-1, 0]
        ]
        @has_moved = false
        @icon = is_white ? '♜' : '♖'
        super
    end
end

class Bishop < Piece

    def initialize(position, is_white)
        @moveset = [
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1]
        ]
        @icon = is_white ? '♝' : '♗'
        super
    end
end

class Queen < Piece
    def initialize(position, is_white)
        @moveset = [
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1],
            [1, 0],
            [0, 1],
            [-1, 0],
            [0, -1]
        ]
        @icon = is_white ? '♛' : '♕'
        super
    end
end