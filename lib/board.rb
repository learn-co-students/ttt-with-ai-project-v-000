require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(cell_number)
    self.cells[cell_number.to_i - 1]
  end

  def full?
    self.cells.all?{|c| c != " "}
  end

  def taken?(position)
    self.cells[position.to_i - 1] != " "
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !taken?(position)
  end

  def turn_count
    self.cells.reject{|c| c == " "}.size
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
end
