class Grid 
    class << self
        private
        @@class_var = 'Test me'
        @@arr_of_symbols = Array.new()
        @@UP_LINE = '|'
        @@LINE = '-'
        attr_reader :name
        attr_reader :surname
        def initialize (someName, someSurname)
            @name = someName
            @surname = someSurname
        end
        9.times{@@arr_of_symbols.push(' ')}
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
        public
        def testMethod
            verticalDraw
        end
    end
end

Grid.testMethod