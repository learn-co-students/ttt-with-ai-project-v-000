class Board
    attr_accessor :cells
    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(pos)
        return @cells[pos.to_i - 1]
    end

    def full?
        cells.none? {|c| c == " "}
    end

    def turn_count
        blank = cells.count {|t| t == " "}
        return (9 - blank)
    end

    def taken?(pos)
        cells[pos.to_i - 1] != " "
    end

    def valid_move?(pos)
        pos.to_i < 10 and pos.to_i > 0 and !taken?(pos)
    end

    def update(pos, player)
        cells[pos.to_i - 1] = player.token 
    end
end
