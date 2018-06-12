require 'pry'

class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    input = user_input.to_i
    @cells[input - 1]
  end

  def full?
    @cells.none? {|cell| cell == " " || cell == nil}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
   input.to_i.between?(1,9) && !(taken?(input))
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token

    @cells.none? {|cell| cell == " " || cell == nil} #added brackets
  end
end
