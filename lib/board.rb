class Board
  attr_accessor :cells

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(p)
    self.cells[p.to_i - 1]
  end

  def full?
    if self.cells.any? { |e| e == " " }
      return false
    else
      return true
    end
  end

  def turn_count
    self.cells.count{ |e| e == "X" || e == "O" }
  end

  def taken?(p)
    if position(p) == "X" || position(p) == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(p)
    if taken?(p) || p.to_i == 0
      return false
    else
      return true
    end
  end

  def update(p,player)
      self.cells[p.to_i - 1] = player.token
  end

end
