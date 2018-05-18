require 'pry'
class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(index)
    @cells[index.to_i - 1]
  end
  
  def full?
    @cells.none? {|c| c == " "}
  end
  
  def turn_count
    @cells.count {|c| c == "X" || c == "O"}
  end
  
  def taken?(index)
    index = index.to_i - 1
    !(@cells[index].nil? || @cells[index] == " ")
  end
  
  def valid_move?(index)
  #
  index.to_i.between?(1,9) && !taken?(index) ? true : false  
  end
  
  def update(index,player)
    index = index.to_i - 1
    
    @cells[index] = player.token
  end
end