require 'pry'
class Board

  attr_accessor :cells

  def cells
    @cells = []
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    binding.pry
  end

end
