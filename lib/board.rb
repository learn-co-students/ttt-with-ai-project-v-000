class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts "------------"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(position)
    self.cells[position.to_i - 1]
  end

  def full?
    self.cells.none? { |cell| cell == " " }
  end

  def turn_count
    self.cells.count { |cell| cell != " " }
  end

  def taken?(position)
    position(position) != " "
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !taken?(position)
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token if valid_move?(position)
  end

end
