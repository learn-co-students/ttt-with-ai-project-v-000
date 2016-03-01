require 'pry'
class Board
attr_accessor :cells
@cells=[]
def initialize
  reset!
end

def reset!
 self.cells = Array.new(9, " ")
end

def display
puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
puts "-------------"
puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
puts "-------------"
puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(input)
cel_num= input.to_i - 1
cells[cel_num]
end

def full?
  if cells.include?(" ")
    false
  else
    true
  end
end  

def turn_count
  turns=[]
turns=cells
turns.delete_if {|x| x==" "}
turns.count
end

def taken?(input)
  if position(input)=="X" || position(input)=="O"
    true
  else
    false
  end
end

def valid_move?(input)
  if input.to_i.between?(1,9) && taken?(input)==false
    true
  else
    false
  end
end

def update(input,player)
 cells[input.to_i - 1]= player.token
end



end