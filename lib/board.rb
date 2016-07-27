require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(location)
    self.cells.at(indexed(location) - 1)
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def taken?(location)
    position(location) == "X" || position(location) == "O"
  end

  def valid_move?(location)
    indexed(location).between?(1, 9) && !(taken?(location))
  end

  def full?
    self.cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    9 - cells.count {|i| i == " "}
    # OR
    # @board.count{|token| token == "X" || token == "O"}
  end

  def update(location, player)
    cells[indexed(location) - 1] = player.token
  end

  # helper method
  def indexed(location_string)
    location_string.to_i
  end


end
