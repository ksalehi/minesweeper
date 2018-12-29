require_relative "tile"

class Grid
    attr_accessor :game_over

    def generate_grid(filename)
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map.with_index do |row, rowIdx|
            nums = row.split('')
            nums.map.with_index do |val, valIdx|
                Tile.new(val, [rowIdx, valIdx], self)
            end
        end
    end

    def initialize
        @grid = generate_grid('seed.txt')
    end

    def render
        puts "    #{(0..8).to_a.join(' ')} \n\n"
        @grid.each_with_index do |row, idx|
            puts "#{(idx + 65).chr}   #{row.join(' ')}"
        end
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def won?
        @grid.all? {|row| row.all? { |tile| tile.revealed? || tile.is_bomb?}}
    end

    def lost?
        @game_over
    end

    def reveal_tile(coords)
        x, y = coords
        tile = @grid[x][y]
        if tile.value == 'X'
            @game_over = true
        end

        tile.reveal
    end

    def reveal_all
        @grid.each do |row|
            row.each do |tile|
                tile.reveal
            end
        end
        render
    end
end
