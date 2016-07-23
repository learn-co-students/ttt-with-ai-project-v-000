require "pry"
class Board
  attr_accessor :cells


  def initialize
    reset!
   end

  def cells
    @board = []
  end
  #
  def reset!
    @cells = Array.new(9," ")
  end

  def display
    print @board
  end
  
end
