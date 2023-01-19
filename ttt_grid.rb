class DrawGrid
    class << self
        private
        @@LINE = '-'
        @@UP_LINE = '|'
        @@space_times_n = "\s"
        def horizontal
            for i in 1..11
                if i%4 == 0
                    print '+'
                else
                    print @@LINE
                end
            end
            puts ' '
        end
        def verticalFull
                3.times {print @@space_times_n}
                print @@UP_LINE
        end
        def verticalSymbol(sym)
                print @@space_times_n
                print sym
                print @@space_times_n
        end
        def verticalWithSymbol(pos = 0, sym = " ")
            case pos
            when 0
                verticalSymbol(sym)
                print @@UP_LINE
                verticalFull
            when 1
                verticalFull
                verticalSymbol(sym)
                print @@UP_LINE
            when 2
                2.times{verticalFull}
                verticalSymbol(sym)
            end
            puts ""
        end
        def vertical_horizontal(pos = 0, sym = ' ')
            verticalWithSymbol(pos, sym)
            horizontal
        end
        def draw(posX = 0, posY = 0, sym = 'X') 
            puts `clear`
            case posX
            when 0
                vertical_horizontal(posY, sym)
                for i in 1..2
                    vertical_horizontal
                end
            when 1
                vertical_horizontal
                vertical_horizontal(posY, sym)
                vertical_horizontal
            when 2
                2.times{vertical_horizontal}
                vertical_horizontal(posY, sym)
            end
        end
        public
        def drawGrid
            draw
        end
    end
end

DrawGrid.drawGrid

# Menu.verticalTry