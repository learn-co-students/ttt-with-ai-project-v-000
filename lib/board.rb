require 'pry'
class Board

  attr_accessor :cells

  def initialize
    binding.pry
    @cells = cells
    cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

end
