require 'pry'

class Board
  attr_accessor :cells

  @cells = []

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
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
    "#{self.cells[input.to_i - 1]}"
  end

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(input)
    position(input) == ("X") || position(input) == ("O")
  end

  def valid_move?(input)
    !taken?(input) && (1..9).include?(input.to_i)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

end
