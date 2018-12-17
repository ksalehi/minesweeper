
class Tile
    attr_accessor :value, :revealed

    def initialize(value)
        @value = value
        @revealed = false
    end

    def value
        @value
    end

    def to_s
        @revealed ? @value.to_s : '?'
    end
end
