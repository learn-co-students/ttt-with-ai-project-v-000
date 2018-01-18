class Board
  attr_accessor :cells

 def initialize()
   @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end

  def cells
    @cell = []
  end

  def reset!
    cell.clear
  end


end
