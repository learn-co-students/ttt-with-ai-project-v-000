
class Board
  attr_accessor :cells
    def initialize(cells = [" ", " "," "," "," "," "," "," "," "])
      @cells = cells
    end

    def reset!
      @cells = [" ", " "," "," "," "," "," "," "," "]
    end
    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(normalized_index)
      @cells[normalized_index.to_i - 1]
    end
    def taken?(normalized_index)
      cell = position(normalized_index)
      return false if(cell != "X" && cell != "O")
      return true
    end

    def valid_move?(normalized_index)
      if(normalized_index.to_i > 0 && normalized_index.to_i < 10)
        return !(taken?(normalized_index))
      end
      return false;
    end

    def full?
      @cells.each do |cell|
        return false if(cell != "X" && cell != "O")
      end
      return true
    end

    def turn_count
      turn = 0
      @cells.each do |mark|
        turn += 1 if(mark == "X" || mark == "O")
      end
      return turn
    end
    def update(cell, player)
      @cells[cell.to_i-1] = player.token
    end
end
