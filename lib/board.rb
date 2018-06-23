class Board
    attr_accessor :board, :cells, :token


    def initialize
        reset!
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def position(square)
        cells[square.to_i - 1]
    end

    def update(input, player)
        cells[input.to_i - 1] = player.token
    end

    def full?
        self.cells.all? do |t|
            t == "X" || t == "O"
        end
    end

    def turn_count
      count = 0
      self.cells.each do |t|
        if t == "X" || t == "O"
        count += 1
      end
    end
      return count
    end

    def taken?(square)
        return true if self.position(square) != " "
    else
        false
    end

    def valid_move?(square)
        return true if square.to_i.between?(1,9) && !self.taken?(square)
    else
        false
    end

end
