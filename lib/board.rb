class Board
    
    attr_accessor :cells
  
  def reset!
    @cells = Array.new(9, " ")
  end 

  def initialize
    reset!
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  #coverts input to an integer
  def position(user_input)    
    index = user_input.to_i
    index -= 1
    return cells[index]
  end
  
  def update(user_input, player) #player object
    index = user_input.to_i
    index -= 1
    cells[index] = player.token     
  end
  
  def full?
    cells.all? {|token | token == "X" || token == "O"}   
  end 

  def turn_count
    counter = 0
    cells.each do |i|
    if i == "X" || i == "O"
      counter += 1
      end
    end
   return counter.to_i
  end
  
  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O"
  end
  
  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end
   
end #class Board