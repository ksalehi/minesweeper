require_relative "grid"

class Minesweeper
    def initialize
        @grid = Grid.new()
        @game_over = false
    end

    def run
        until @grid.won? || @grid.lost?
            @grid.render
            coords = get_move
            reveal(coords)
        end

        if @grid.won?
            puts "Congratulations, you win!"
        elsif @grid.lost?
            puts "Game over :("
            @grid.reveal_all
        end
    end

    def get_move
        coords = nil

        until coords && is_valid?(coords)
            puts "Please enter the coordinates of the tile you want to reveal (eg, 'C1'):"
            print "> "

            begin
                coords = parse_input(gets.chomp)
            rescue
                puts "Invalid input format"
                coords = nil
            end
        end

        coords
    end

    def parse_input(input)
        x, y = input.split('')
        [x.ord - 65, Integer(y)]
    end

    def reveal(coords)
        @grid.reveal_tile(coords)
    end

    def is_valid?(coords)
        if coords.is_a?(Array) &&
            coords.length == 2 &&
            coords.all? { |x| x.is_a?(Integer) && x.between?(0, 8) }
            return true
        else
            puts "\nInvalid input format"
        end
    end
end

minesweeper = Minesweeper.new()
minesweeper.run()
