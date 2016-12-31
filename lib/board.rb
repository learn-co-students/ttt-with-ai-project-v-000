class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position(pos)
    self.cells[input_to_index(pos)]
  end

  def full?
    self.cells.none? { |cell| cell == " " }
  end

  def turn_count
    self.cells.count { |cell| cell != " " }
  end

  def taken?(pos)
    position(pos) != " "
  end

  def valid_move?(pos)
    index = input_to_index(pos)
    index.between?(0, 8) && !taken?(pos)
  end

  def update(pos, player)
    self.cells[input_to_index(pos)] = player.token
  end
end
