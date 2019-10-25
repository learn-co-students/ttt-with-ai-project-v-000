class Board

  attr_accessor :cells
  def initialize(cells = nil)
    self.cells = cells || Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def self.index(position)
    index = position.to_i - 1
  end
  
  def position(position)
    self.cells[Board.index(position)]
  end

  def full?
    self.cells.none?{|i| i == " "}
  end

  def turn_count
    self.cells.count{|cell| cell != " "}
  end

  def taken?(position)
    self.cells[Board.index(position)] != " "
  end

  def valid_move?(position)
    Board.index(position).between?(0, 8) && !self.taken?(position)
  end

  def update(position, player)
    self.cells[Board.index(position)] = player.token
  end
end