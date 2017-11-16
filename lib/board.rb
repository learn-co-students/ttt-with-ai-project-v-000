class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9," ")
  end

  def reset!
    self.cells.clear
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.detect {|i| i == " "} ? false : true
  end

  def turn_count
    self.cells.select{|i| i == "O" || i == "X"}.length
  end

  def taken?(pos)
    pos = pos.to_i - 1
    self.cells[pos] == "X" || self.cells[pos] == "O" ? true : false
  end

  def valid_move?(pos)
    pos = pos.to_i
    !self.taken?(pos) && pos > 0 && pos < 10 ? true : false
  end

  def update(pos, player)
    pos = pos.to_i
    if player.token == "X"
      self.cells[pos-1] = "X"
    else
      self.cells[pos-1] = "O"
    end
  end
end
