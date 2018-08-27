class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells.replace(Array.new(9, " "))
  end
end