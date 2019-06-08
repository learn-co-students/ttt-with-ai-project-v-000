require 'pry'
class Board
  attr_accessor :cells

  # Why is board.cells accepting empty Array?
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def input_to_index(input)
    input.to_i - 1
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.select { |value| value == "O" || value == "X" }.count
  end

  def taken?(input)
    position(input).include?("X") || position(input).include?("O")
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token if valid_move?(input)
  end

end