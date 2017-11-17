class Board

  attr_accessor :cells, :turn_count

  def initialize
    self.reset!
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

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    if self.cells.all?{|x| x == "X" || x == "O"}
      true
    else
      false
    end
  end

  def turn_count
    self.cells.count { |y| y == "X" || y == "O"}
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O" ? true : false
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, token)
    self.turn_count.odd? ? token = "O" : token = "X"
    self.cells[input.to_i - 1] = token
    self.display
  end
end
