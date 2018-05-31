require 'pry'
class Board
  attr_accessor :cells
  
  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
   puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(num)
    input = num.to_i - 1 
    self.cells[input]
  end
  
  def full?
    self.cells.all? {|c| c != " "}
  end 
  
  def turn_count
    count = 0 
    self.cells.each {|c| if c != " "; count +=1 end}
    count
  end 
  
  def taken?(index)
    self.position(num) != " " || self.position(num) != ""
  end 
  
  def valid_move?(index)
    num.to_i <= 9 && num.to_i >= 1 && !taken?(num) ? true : false
  end 
  
  def update(num, player)
    self.cells[num.to_i - 1] = player.token
  end 
end 