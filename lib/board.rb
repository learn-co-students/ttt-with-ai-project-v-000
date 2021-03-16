require 'pry'
class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    initialize
  end
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(pos)
    @cells[pos.to_i - 1]
  end
  
  def full?
    @cells.none?(" ")
  end
  
  def turn_count 
    9 - @cells.count(" ")
  end
  
  def taken?(pos)
    position(pos) == " " ? false : true
  end
  
  def valid_move?(pos)
    !taken?(pos) && pos.to_i.between?(1, 9)
  end
  
  def update(pos, token)
    turn_count.even? ? token = "X" : token = "O"
    @cells[pos.to_i - 1] = token if valid_move?(pos)
  end
end