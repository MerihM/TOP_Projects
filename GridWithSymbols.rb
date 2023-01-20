module Grid 
    class << self
        private
        @@arr_of_symbols = Array.new(3) {Array.new()}
        @@clean_arr = Array.new(3){Array.new()}
        @@UP_LINE = '|'
        @@LINE = '-'
        for i in 0..2
            3.times{@@arr_of_symbols[i].push(" ")}
            3.times{@@clean_arr[i].push(" ")}
        end
        def newSymbol(sym, pos)
            @@arr_of_symbols[pos-1] = sym
        end
        def verticalSymbol(sym)
            print " "
            print sym
            print " "
        end
        def verticalDraw(arr)
            verticalSymbol(arr[0])
            print @@UP_LINE
            verticalSymbol(arr[1])
            print @@UP_LINE
            verticalSymbol(arr[2])
            puts ""
        end
        def horizontalDraw
            2.times { 3.times{print @@LINE}; print '+'}
            3.times{print @@LINE}
            puts ""
        end
        def drawGrid
            verticalDraw(@@arr_of_symbols[0])
            horizontalDraw
            verticalDraw(@@arr_of_symbols[1])
            horizontalDraw
            verticalDraw(@@arr_of_symbols[2])
        end
        def modifyArray(posX, posY, sym)
            @@arr_of_symbols[posX][posY] = sym
        end
        public
        def tttGrid
            puts `clear`
            drawGrid
        end
        def ttt(x, y, sym)
            modifyArray(x, y, sym)
            p @@arr_of_symbols
        end
        def clearGrid
            @@arr_of_symbols = @@clean_arr
            tttGrid
        end
    end
end

Grid.ttt(1, 2, 'X')
Grid.tttGrid
Grid.ttt(2, 2, '0')
Grid.tttGrid
Grid.ttt(2, 1, 'X')
Grid.tttGrid
Grid.clearGrid
