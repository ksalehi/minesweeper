require_relative "grid"

class Minesweeper
    def initialize
        @grid = Grid.new()
    end

    def reveal_tile
    end

    def start
        @grid.render()
        puts "enter the coordinates of the tile you want to reveal (eg, '2, 1'):"
        input = gets.chomp

        print input && is_valid?(input)
        #     puts "please enter a valid input (eg, '2, 1'):"
        # end
    end

    def is_valid?(input)
        debugger 
        # puts type(input)
        puts x
        puts y

        input.length == 2 &&
        type(x) == Integer &&
        type(y) == Integer &&
        (x.is_between(0, 8)) &&
        (y.is_between(0, 8))
    end
end

# puts "welcome to minesweeper. would you like to play (y/n)"
# input = gets.chomp
# if input == "y"
#     puts "okay, let's get started..."
#     grid_size_x = 10
#     grid_size_y = 10
minesweeper = Minesweeper.new()
minesweeper.start()
# else
#     puts "okay, see you next time!"
# end
