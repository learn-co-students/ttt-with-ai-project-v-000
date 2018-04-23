
class Board
  attr_accessor :cells

  def initialized
    self.reset!

  end

  def reset!
    self.cells = Array.new(9, " ")
  end
end
