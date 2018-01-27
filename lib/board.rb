class Board

  attr_accessor :cells

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

end
