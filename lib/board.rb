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

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    i = 9
    cells.each {|cell| i -= 1 if cell == " "}
    i
  end

  def taken?(input)
    position(input) == "X" or position(input) == "O"
  end

  def valid_move?(input)
    !taken?(input) and (1..9).include?(input.to_i)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
