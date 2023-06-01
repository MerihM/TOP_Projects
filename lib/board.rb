class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(8){Array.new(8, nil)}
    end

    def move_piece(piece, position)

    end


    def display
        # clear
        # ChessText.title
        display_top_border
        display_rows
        display_bottom_border
        display_x_axis
    end

    def display_top_border
        puts '   ┌────┬────┬────┬────┬────┬────┬────┬────┐'
      end
    
      def display_rows
        (1..7).each do |row_number|
          display_row(row_number)
          display_separator
        end
        display_row(8)
      end
    
      def display_row(number)
        square = number.even? ? 0 : 1
        print "#{9 - number}  "
        @grid[number - 1].each do |position|
          if position.nil?
            print square.even? ? '│    ' : "│#{'    '}"
          else
            print square.even? ? "│ #{position.icon}  " : "│#{" #{position.icon}  "}"
          end
          square += 1
        end
        puts '│'
      end
    
      def display_separator
        puts '   ├────┼────┼────┼────┼────┼────┼────┼────┤'
      end
    
      def display_bottom_border
        puts '   └────┴────┴────┴────┴────┴────┴────┴────┘'
      end
    
      def display_x_axis
        puts "     a    b    c    d    e    f    g    h  \n\n"
      end
end

brd = Board.new
brd.display