class Board
  attr_accessor :cells
  attr_reader :token

@cells = []  

def initialize
  @cells = []
  reset!
end 


def reset!
  @cells = Array.new(9, " ")
end 

def display
puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
puts "-----------"
puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
puts "-----------"
puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end 

def position(input)
  spot = input.to_i - 1 
return @cells[spot]
end

def full?
  @cells.all? { |spots| spots == "X" || spots == "O"}
end 

def turn_count
  count = 0
  
  @cells.each do |spots|
    if spots == "X" || spots =="O"
      count += 1
    end 
  end 
  return count
end

def taken?(input)
  spot = position(input)
  if spot == "" || spot == " " || spot == nil
    return false
  else
    return true
end 
end

def valid_move?(input)
  spot = input.to_i - 1
  if spot.between?(0, 8) && taken?(input) == false
    return true
  else
    return false
  end 
end 

def update(spot, player)
  move = spot.to_i - 1
  @cells[move] = player.token
end 

end 

  