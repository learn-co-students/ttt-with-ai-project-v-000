class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = [" "," "," "," "," "," "," "," "," "]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        @cells[input.to_i-1]
    end

    def update (pos, obj)
        @cells[pos.to_i-1]=obj.token
    end

    def full?
        @cells.all?{|cell| cell!=" "}
    end

    def turn_count
        @cells.count{|cell| cell!=" "}
    end

    def taken?(pos)
        @cells[pos.to_i-1]!=" "
    end

    def valid_move?(pos)
        pos.to_i>0 && pos.to_i<10 && !taken?(pos)
    end

end
