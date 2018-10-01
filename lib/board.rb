class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    position = input.to_i - 1
    cells[position]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    9 - self.cells.count(" ").to_i
  end

  def taken?(input)
    input_position = self.position(input)
    input_position == "X" || input_position == "O"
  end

  def valid_move?(move)
    move.to_i.between?(1, 9) && !taken?(move)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end