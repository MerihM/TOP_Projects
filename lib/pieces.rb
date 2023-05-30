class Pawn
    attr_accessor :move
    def initialize
        @move = [0, 1]
    end
end

class Rook
    attr_accessor :move
    
end

class Knight
    attr_accessor :move
    def initialize
        @move = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    end
end

class Bishop 

end

class Queen

end

class King 
    attr_accessor :move
    def initialize
        @move = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    end
end
