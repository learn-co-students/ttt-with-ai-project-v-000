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

    def position(index)
      @cells[index.to_i - 1]
    end

    def taken?(index)
       position(index) != " " || position(index) == "" ? true : false
    end

    def full?
      @cells.all?{|cell| cell != " "}
    end

    def turn_count
      9-@cells.count(" ")
    end

    def valid_move?(index)
      !taken?(index) && index.to_i.between?(1,9) ? true : false
    end

    def update(index, player)
      @cells[index.to_i-1] = player.token
    end
end
