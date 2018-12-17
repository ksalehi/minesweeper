require_relative "tile"

class Grid
    def generate_grid(filename)
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split('').map { |val| Integer(val) }
            nums.map { |num| Tile.new(num) }
        end
    end

    def initialize
        @grid = generate_grid('seed.txt')
    end

    def render
        puts "    #{(0..8).to_a.join(' ')}"
        puts " "
        @grid.each_with_index do |row, idx|
            puts "#{idx}   #{row.join(' ')}"
        end
    end
end
