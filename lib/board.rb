require 'pry'

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

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.none? {|cell| cell == " "}
  end 

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end 

  def taken?(position)
    cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
  end  

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position) 
  end 

  def update(position, player)
    position = position.to_i - 1
    cells[position] = "#{player.token}"
  end    

end  

