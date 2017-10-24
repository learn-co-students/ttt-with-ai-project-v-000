require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    # creates new array -- is this a problem?
    @cells = Array.new(9, " ")
  end

  # returns token from input
  def position(location)
    # self.cells.at(indexed(location) - 1)
    self.cells[location.to_i - 1]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
		puts "-----------"
		puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
		puts "-----------"
		puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def taken?(location)
    # !(position(location).nil? || position(location) == " ")
    position(location) == "X" || position(location) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !(taken?(input))
  end

  def full?
    self.cells.all?{|token| token == "X" || token == "O"}
  end

  # returns the number of turns by counting X's and Y's on board
  def turn_count
    self.cells.count{|token| token == "X" || token == "O"}
  end

  def update(location_string, player)
    self.cells[indexed(location_string) - 1] = player.token
  end

  # helper method
  def indexed(location_string)
    location_string.to_i
  end


end
