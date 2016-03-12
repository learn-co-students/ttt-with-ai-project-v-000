#require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
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

  def position(space)
    self.cells[space.to_i-1]
  end

  def full?
    @cells.none? {|cell| cell == " "}
  end

  def turn_count
    @cells.select {|cell| cell == "X" || cell == "O" }.size
  end

  def taken?(space)
    position(space) == "X" || position(space) == "O"
  end

  def valid_move?(space)
    !taken?(space) && space.to_i.between?(1,9)
  end

  def update(space, player)
    # binding.pry
    @cells[space.to_i-1] = player.token
  end

end
