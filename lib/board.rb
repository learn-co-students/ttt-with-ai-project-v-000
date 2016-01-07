class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    position = position(input)
    position == "X" || position == "O"
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end