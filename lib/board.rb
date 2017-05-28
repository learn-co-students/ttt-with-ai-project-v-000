class Board

  attr_accessor :cells

  def reset!
    cells.clear
    9.times { cells << " " }
  end
end