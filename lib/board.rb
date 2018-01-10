require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(space)
    input = space.to_i
    @cells[input - 1]
  end

  def update
  end

  def token
  end

  def full?
  end

  def turn_count
  end

  def taken?(space)
    if space == "X" || "O"

  end

  def valid_move?
  end

end
