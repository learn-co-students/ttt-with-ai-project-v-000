class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts "\n"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "\n"
    puts "\n"
  end

  def position_to_index(position)
    position.to_i - 1
  end

  def position(position)
    if position.to_i >= 1 && position.to_i <= 9
      index = self.position_to_index(position)
      self.cells[index]
    end
  end

  def update(position, player)
    index = self.position_to_index(position)
    self.cells[index] = player.token
  end

  def full?
    self.cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    self.position(position) == "X" || self.position(position) == "O"
  end

  def valid_move?(position)
    self.position(position) == " "
  end

end
