
class Menu
    class << self
    private
    $line = '-'
    $up_line = '|'
    def horizontal
        for i in 1..29
            if i%10 == 0
                print '+'
            else
                print $line
            end
        end
        puts ' '
    end
    def vertical
        for i in 1..2
            for j in 1..9
                print " "
            end
            print $up_line
        end
        puts ""
    end
    def vertical_horizontal
        for i in 1..3
            vertical
        end
        horizontal
    end
    def draw 
        puts `clear`
        for i in 1..2
            vertical_horizontal
        end
        for i in 1..3
            vertical
        end
    end
    public
    def drawMenu
        draw
    end
    def drawX

    end
end
end

Menu.drawMenu