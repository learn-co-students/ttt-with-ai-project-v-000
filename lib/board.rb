class Board
  
  attr_accessor :cells
  
  def initialize
    @cells =[" ", " ", " ", " ", " ", " ", " "," ", " "]
  end
  
  def reset!
    @cells =[" ", " ", " ", " ", " ", " ", " "," ", " "]
  end


def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells [5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end



def position(input)
  @cells[input.to_i - 1] 
end

def full?
 if @cells.include?(" ")
  false
  else 
   true
  end
end  

def turn_count
  counter = 0
  @cells.each do|space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def taken?(input)
  @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
end

def valid_move?(input)
  (input.to_i. -1).between?(0,8) && !taken?(input)
end

def update(input, player)
  input = (input.to_i - 1)
  cells[input] = player.token
end

end