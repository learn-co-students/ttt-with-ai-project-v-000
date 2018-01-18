class Board
  attr_accessor :cells

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts  " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts  "-----------"
    puts  " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts  "-----------"
    puts  " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def index(location)
    location.to_i - 1
  end

  def position(location)
    self.cells[self.index(location)]
  end

  def full?
    cells.all? { |cell| cell != " "}
  end

  def turn_count
    cells.count{ |token| token == "X" || token == "O" }
  end

  def taken?(location)
    !(self.cells[self.index(location)] == " ")
  end

  def valid_move?(location)
    !taken?(location) && location.to_i.between?(1,9)
  end

  def update(location, player)
    self.cells[self.index(location)] = player.token
  end
end
