require 'pry'
class Board
  attr_accessor :cells

  def reset!
  @cells = Array.new(9, " ")
  end

  def initialize
    reset!
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
    self.cells.all? {|cell| cell == 'X' || cell == 'O'}
 end

  def turn_count
    self.cells.select {|cell| cell == 'X' || cell == 'O'}.size
 end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
 end

end
