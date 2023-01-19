
class Menu
    class << self
    private
    $line = '-'
    $up_line = '|'
    def horizontal
        for i in 1..43
            if i%11 == 0
                print '+'
            else
                print $line
            end
        end
        puts ' '
    end
    def vertical
        for i in 1..3
            for j in 1..10
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
        for i in 1..3
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
end
end

Menu.drawMenu