require 'pry'
class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def cells
    @cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_index(input)
    input = input.to_i
    input -= 1
  end
  def position(input)
    cells[input_to_index(input)]
  end

  def count
    cells.find_all {|c| c == "X" || c == "O"}.size
  end

  def full?
    cells.none? {|i| i == " "}
  end

  def turn_count
    cells.find_all {|cell| cell != " "}.length
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "" || position(input) == nil)
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    input = input_to_index(input)
    cells[input] = player.token
  end
end
