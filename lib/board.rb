require 'pry'

class Board
  attr_accessor :cells, :player

  def cells
    @cells
  end

  def initialize
    self.reset!
    self.display
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def update(input, player)     # player here is the player object, not player name.
    self.cells[input.to_i - 1] = player.token
  end

  def full?
    self.cells.none?{|pos| pos == " "}
  end

  def turn_count
    self.cells.select{|pos| pos != " "}.length
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    ("1".."9").include?(input) && position(input) == " "
  end

end
