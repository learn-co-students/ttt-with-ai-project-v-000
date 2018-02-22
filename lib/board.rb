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

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    !(cells.include?(" "))
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(input)
    position(input) == " " ? false : true
  end

  def valid_move?(input)
    !(taken?(input)) && input.to_i > 0 && input.to_i < 10
  end

  def update(input, player)
    index = input.to_i - 1
    index.even? ? cells[index] = "X" : cells[index] = "O"
  end
end
