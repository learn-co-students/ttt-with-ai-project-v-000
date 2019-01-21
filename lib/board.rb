class Board

attr_accessor :cells

  def initialize
    # @@cells = []
  end

  def reset!
    cells.clear
    cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end



end
