class Board
  attr_accessor :cells, :token
  def initialize
    self.reset!
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

  def position(input)
    index = input.to_i
    index -= 1
    self.cells[index]
  end

  def update(position, player)
    index = position.to_i
    index -= 1
    self.cells[index] = player.token
  end

  def full?
    self.cells.none? {|cell| cell == " "}
  end

  def turn_count
    self.cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(position)
    index = position.to_i
    index -= 1
    if self.cells[index] != " "
      true
    else
      false
    end
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end
end
