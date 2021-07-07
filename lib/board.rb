class Board
  require 'pry'
attr_accessor :cells

def reset!
  @cells.clear
  @cells=[" "," "," "," "," "," "," "," "," "]
end
def initialize
    @cells=[" "," "," "," "," "," "," "," "," "]
end
def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end
def position(user_input)
  input=user_input.to_i-1
  @cells[input]
end
def full?
  @cells.each do |i|
 if @cells.any?{|i|i ==" "}
   return false 
else return true 
 end 
end
end
def turn_count
   @cells.count{|value|value =="X" || value== "O"}
end
def taken?(input)
  if position(input)== " " || position(input)==""
    return false
  else return true
end
end
def valid_move?(input)
  
  input.to_i.between?(1,9) && !taken?(input)
end
def update(input, player)
  @cells[input.to_i-1]= player.token
end
  
end