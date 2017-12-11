class Board
  attr_accessor :cells

  @cells = []
  turn_count = 0

  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
    self.cells.all? { | entry | entry == "X" || position == "O" }
  end

  def turn_count
    self.cells.count{ | x | x == "X" || x == "O" }
  end

  # def taken?(position)
  #   self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  # end
end
