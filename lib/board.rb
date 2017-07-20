class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
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

  def full?
    self.cells.all? do |token|
      token == "X" || token == "O"
    end
  end

  def turn_count
    self.cells.count do |token|
      token == "X" || token == "O"
    end
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    !taken?(input) && input_to_index(input).between?(0,8)
  end

  def update(input, player)
    index = input_to_index(input)
    cells[index] = player.token
  end

  private

  def input_to_index(input)
    input.to_i - 1
  end
end
