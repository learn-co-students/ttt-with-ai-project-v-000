
class Board
  attr_accessor :cells

  def initialize
    self.reset!

  end

  def reset!
    self.cells = [" "] * 9
  end

  def display
    d = self.cells

    puts "-----------"
    puts " #{d[0]} | #{d[1]} | #{d[2]} "
    puts "-----------"
    puts " #{d[3]} | #{d[4]} | #{d[5]} "
    puts "-----------"
    puts " #{d[6]} | #{d[7]} | #{d[8]} "
    puts "-----------"
  end

  def position(location)
    c = self.cells

    c[location-1]
  end
end
