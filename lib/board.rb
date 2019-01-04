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

  def position(index)
    puts index
    self.cells[index.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    x = self.cells.count("X")
    o = self.cells.count("O")
    x += o
  end

  def taken?(index)
    position(index) != " "
  end

  def valid_move?(index)
    !taken?(index) && (1..9).include?(index.to_i)
  end

  def update(index, player)
    self.cells[index.to_i - 1] = player.token
  end

  def instruction_board
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end
end
