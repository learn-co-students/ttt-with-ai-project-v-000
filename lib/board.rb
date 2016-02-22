require "pry"
class Board
  attr_accessor :cells

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  CORNERS = [0, 2, 6, 8]
  OUTER_MIDDLES = [1, 3, 5, 7]

  def initialize
    reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts ""
  end

  def position(number)
    number = number.to_i - 1 if number.class == String
    cells[number]
  end

  def full?
    cells.none? { |cell| cell == " "}
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(position_number)
    position(position_number) != " "
  end

  def valid_move?(position_number)
    position_number.to_i.between?(1,9) && !taken?(position_number)
  end

  def update(position_number, player)
    position_number = position_number.to_i - 1 if position_number.class == String
    cells[position_number] = player.token
  end

  def almost_won # should return the combo that's almost won
    WIN_COMBINATIONS.detect do |combo|
      (position(combo[0]) != " " && position(combo[0]) == position(combo[1]) && position(combo[2]) == " ") || (position(combo[1]) != " " && position(combo[1]) == position(combo[2]) && position(combo[0]) == " ") || (position(combo[0]) != " " && position(combo[0]) == position(combo[2]) && position(combo[1]) == " ")
    end
  end

  def corners
    CORNERS
  end

  def outer_middles
    OUTER_MIDDLES
  end
end