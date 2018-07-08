class Board 
  
  attr_accessor :cells 
  
def initialize(cells = [" "," "," "," "," "," "," "," "," "])
  @cells = cells
end 
  
  def cells
    @cells = []
  end 
  
def reset! 
    @cells = [" "," "," "," "," "," "," "," "," "]
end 

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end 

def position
  puts "Please enter 1-9:"
  input = gets.strip
  index = index.to_i 
  index -= 1
current_player = current_player(board)
  if self.valid_move?(index+1)
    cells[index] = "X"
    self.display
  end 
end

def update

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

def taken?(index)
  index = index.to_i
  index -=1 
  !(@cells[index].nil? || @cells[index] == " ")
end 

def valid_move?(index)
    index = index.to_i
    index -=1 
    index.between?(0,8) && !self.taken?(index+1)
end 

end 
