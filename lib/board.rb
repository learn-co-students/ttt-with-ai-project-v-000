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

  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == "X" || @cells[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if input.to_i > 0 && input.to_i < 10 && !taken?(input)
      return true
    else
      return false
    end
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player
  end

end
