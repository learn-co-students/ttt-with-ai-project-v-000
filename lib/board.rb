require "pry"
class Board
  attr_accessor :cells

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    new_num = num.to_i - 1
    @cells[new_num]
  end

  def full?
     cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    counter = @cells.count(" ")
    9 - counter
  end

  def taken?(num)
    position(num) == "X" || position(num) == "O"
  end

  def valid_move?(num)
    num.to_i.between?(1, 9) && !taken?(num)
  end

  def update(num, player)
    @cells[num.to_i-1] = player.token
  end

end
