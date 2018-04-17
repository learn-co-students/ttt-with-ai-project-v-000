require 'pry'

class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells [5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    if !(cells.include?(" "))
      true
    end
  end

  def turn_count
    cells.count{|t| t == "X" || t == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    taken?(input) == false && input.to_i.between?(1,9) == true
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
