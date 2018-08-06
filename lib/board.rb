require "pry"
class Board 
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def reset! 
    @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
 
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
  
  def full?
    @cells.all? do |full|
     full == "X" || full == "O"
    end
  end
  
  def turn_count 
    @cells.count{|turn| turn == "X" || turn == "O"}
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  
  def valid_move?(input)
    input.to_i >=1 && input.to_i <=9 && !taken?(input)
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
