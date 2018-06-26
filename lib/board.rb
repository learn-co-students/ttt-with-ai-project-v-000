class Board
  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts "( #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} )"
    puts "-----------"
    puts "( #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} )"
    puts "-----------"
    puts "( #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} )"
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    turn_number = self.cells.select {|cell| cell == "X" || cell == "O"}
    turn_number.count
  end

  def taken?(position)
    index = position.to_i - 1
    if cells[index] == "X" || cells[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    binding.pry
    position.to_i.between?(0, 8) && !taken?(position)
  end
end
