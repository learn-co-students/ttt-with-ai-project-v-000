class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def position(input)
    cell = input.to_i - 1
    return @cells[cell]
  end

  def display
    puts " #{@cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{@cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{@cells[6]} | #{cells[7]} | #{cells[8]} \n"
  end

  def full?
    @cells.all? do |cell|
      cell == "X" || cell == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    return counter
  end

end
