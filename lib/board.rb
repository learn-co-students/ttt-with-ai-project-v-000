require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.replace([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input_to_int(input)]
  end

  def input_to_int(input)
    input.to_i - 1
  end

  def full?
    @cells.all?{|x_or_o| x_or_o !=" "}
  end

  def turn_count
    @cells.count{|cell| cell != " "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !taken?(input) && input_to_int(input).between?(0,8)
  end

  def update(input, player)
    @cells[input_to_int(input)] = player.token
  end

end
