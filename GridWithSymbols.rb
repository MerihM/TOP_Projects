module Grid 
    class << self
        private
        @@arr_of_symbols = Array.new(3) {Array.new()}
        @@UP_LINE = '|'
        @@LINE = '-'
        def newSymbol(sym, pos)
            @@arr_of_symbols[pos-1] = sym
        end
        def verticalSymbol(sym)
            print " "
            print sym
            print " "
        end
        def verticalDraw(sym = "X")
            2.times{verticalSymbol(sym); print @@UP_LINE}
            verticalSymbol(sym)
            puts ""
        end
        def horizontalDraw
            2.times { 3.times{print @@LINE}; print '+'}
            3.times{print @@LINE}
            puts ""
        end
        def drawGrid
            2.times{verticalDraw; horizontalDraw;}
            verticalDraw
        end
        public
        def tttGrid
            puts `clear`
            drawGrid
        end
        def testMethod
            p @@arr_of_symbols
        end
    end
end

# Grid.tttGrid
Grid.testMethod