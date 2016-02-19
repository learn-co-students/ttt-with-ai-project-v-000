require "pry"
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
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
    cells[position_number.to_i - 1] = player.token 
    # position(position_number) = player.token 
    # why does this work when I type out the contents of the position method, but not when I use the method itself?
  end
end