require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(space)
    space = space.to_i-1
    cells[space].map!{|i| i = "O"}
  end

end
