# The `Board` class represents the data and logic
# of a Tic-tac-toe game board. It has a property, `cells`,
# that stores the data of the state of the board in an array.
# The `#reset!` method can reset the state of the cells
# to what a board should look like at the start of a game,
# an array with 9 `" "` elements.
#
# When a board is initialized, it should start with
# cells for a new game of Tic-tac-toe.
# You can and should use `#reset!`.
#
# A board can print its current state with the `#display` method.
#
# You'll also build a `#position` method that takes in
# the user's input in the form of 1-9 strings like "2" or "9"
# and looks up the value of the cells at the correct index
# from the array's perspective. All other methods will take
# input in the user's perspective of 1-9 strings and use `#position`
# to look up the value according to the cells' array index.
#
# Similarly, you're going to build an `#update` method that
# represents updating the board when a player makes a move.
# This method will take two arguments, the first will be the
# position the user wants to occupy in the form of 1-9 strings that
# you will need to convert to the board cells' array index,
# along with the player object making the move.
# When you update the appropriate index in the cells,
# you will set it equal to the token of the player object
# by calling the `#token` method on the player.
#
# Finally, a board can return values based on its state such as
# `#full?` when entirely occupied with "X" and "O"s and a
# `#turn_count` based on how many positions in the cells array
# are filled. `#taken?` will return true or false for an individual
# position. `#valid_move?` will ensure that moves are between
# 1-9 and not taken.

require 'pry'

class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cell_number)
    cell_index = cell_number.to_i - 1

    position = @cells.detect.with_index do |cell,index|
      cell_index == index
    end

    position
  end

  def full?
    if @cells.any? { |cell| cell == " " }
      return false
    elsif @cells.all? { |cell| cell == "X" || cell == "O" }
      return true
    end
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

  def taken?(cell_number)
    if position(cell_number) == "X" || position(cell_number) == "O"
      true
    elsif position(cell_number) == " "
      false
    end
  end

  def valid_move?(cell_number)
    if cell_number.to_i.between?(1,9)
      unless taken?(cell_number)
        true
      end
    end
  end

end
