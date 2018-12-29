class Tile
    attr_accessor :value, :revealed, :num_neighboring_bombs

    def initialize(value, pos, board)
        @board = board
        @value = value
        @pos = pos
        @revealed = false
        @explored = false
        @is_bomb = value == 'X' ? true : false
    end

    def inspect
        {
            pos: @pos,
            value: @value,
            is_bomb: @is_bomb
        }.inspect
    end

    def to_s
        if @revealed
            if @is_bomb
                'X'
            else
                num_neighboring_bombs.to_s
            end
        else
            '_'
        end
    end

    def revealed?
        @revealed
    end

    def is_bomb?
        @is_bomb
    end

    def reveal
        return if @explored
        @revealed = true
        @explored = true

        if self.num_neighboring_bombs == 0
            self.neighbors.each do |neighbor|
                neighbor.reveal
            end
        end
    end

    def neighbors
        x, y = @pos
        neighbor_coords = [[x-1, y], [x+1, y], [x, y+1], [x, y-1], [x-1, y-1], [x+1, y-1], [x+1, y+1], [x-1, y+1]]
        neighbs = []

        neighbor_coords.each do |w, z|
            if w.between?(0, 8) && z.between?(0, 8)
                neighbs << @board[[w, z]]
            end
        end

        return neighbs
    end

    def num_neighboring_bombs
        bombed_neighbors = neighbors.select do |neighbor|
            neighbor.value == 'X'
        end

        bombed_neighbors.count
    end
end
