require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!;
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    #puts "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    #puts "-----------"
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def update(input, player)
    #position(input) = "X"; #player.token;
  end

  def full?
    !@cells.include?(" ");
  end

  def turn_count
    count = 9 - @cells.count(" ");
  end

  def taken?(input)
   !(position(input) == " " || position(input) == "" )
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !taken?(input);
  end
end
