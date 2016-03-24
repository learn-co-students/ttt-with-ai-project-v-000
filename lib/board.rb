class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(num)
    return self.cells[num.to_i-1]
  end

  def full?
    x = self.cells.count("X")
    o = self.cells.count("O")
    x + o == 9 ? true : false
  end

  def turn_count
    return self.cells.count("X") + self.cells.count("O")
  end

  def taken?(position)
    self.cells[position.to_i-1] == "X" ? true : self.cells[position.to_i-1] == "O" ? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && taken?(position) == false ? true : false
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end
end