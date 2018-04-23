
class Board
  attr_accessor :cells

  def initialize
    self.reset!

  end

  def reset!
    self.cells = [" "] * 9
  end
end
