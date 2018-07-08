require 'pry'

class Board 
  
  attr_accessor :cells
  
def initialize
  @cells = [" "," "," "," "," "," "," "," "," "]
end 
  
  
def reset! 
    @cells = [" "," "," "," "," "," "," "," "," "]
    #binding.pry 
end 

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end 

def position(input)
  input = input.to_i 
  index = input - 1
  @cells[index]
 # if turn_count % 2 == 0
  #  signature = "X"
 # else
   # signature = "O"
 # end
 #binding.pry 
  #if valid_move?(input)
  #  @cells[index] = signature
 # end 
end

def update(input, player)
  input = input.to_i 
  index = input - 1

  if turn_count % 2 == 0
    signature = "X"
  else
    signature = "O"
  end
 #binding.pry 
  if valid_move?(input)
    @cells[index] = signature
  end 
end 

def full?
  @cells.none? do |empty|
  empty =="" || empty ==" "
end
end

def turn_count
  counter = 0
  @cells.each do |position_count|
    if position_count == "X" || position_count =="O"
      counter+=1
    end
  end
  counter 
end 

def taken?(input)
  input = input.to_i
  index = input - 1 
  !(@cells[index].nil? || @cells[index] == " ")
end 

def valid_move?(input)
    input = input.to_i
    index = input - 1
    index.between?(0,8) && !self.taken?(input)
end 

end 
