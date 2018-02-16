class Board
  attr_accessor :cells

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    index = input_to_index(input)
    cells[index]
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def full?
    cells.include?(" ") ? false : true
  end

  def turn_count
    count = 9 - cells.count(" ")
  end

  def taken?(input)
    index = input_to_index(input)
    cells[index] == " " ? false : true
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0, 10) && !taken?(input)
  end

  def update(input, player)
    index = input_to_index(input)
    cells[index] = player.token
  end

end
