require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

  def display

  end
end
