class Board

  attr_accessor :cells

  def initialize
      self.reset!
  end

  def reset!
    self.cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(p = gets)
    self.cells[p.strip.to_i-1]
  end

  def update(position, player)
    self.cells[position.strip.to_i-1] = player.token
  end

  def full?

  end
end
