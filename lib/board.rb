class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(position)
    self.cells[position.to_i - 1]
  end

  def full?
    !self.cells.any? { |a| a == " " }
  end

  def turn_count
    self.cells.size - self.cells.count(" ")
  end

  def taken?(position)
    cell = self.cells[position.to_i - 1]
    cell == "X" || cell == "O"
  end

  def valid_move?(position)
    !self.taken?(position) && (position.to_i >= 1 && position.to_i <= 9)
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token unless self.taken?(position)
  end
end
