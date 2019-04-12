class Board 
  attr_accessor :cells, :game
 
  def reset!
   @cells.clear
   @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
 
  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(u_input)
    @cells[u_input.to_i - 1]
  end
  
  def full?
    @cells.all? do |t|
      t == "X" || t == "O"
    end
  end
  
  def turn_count
    @cells.count do |token| 
      token == "X" || token == "O"
    end
    #counts the number of tokens in the @cells array
  end
  
  def taken?(u_input)
    @cells[u_input.to_i-1] == "X" || @cells[u_input.to_i-1] == "O" 
    #checks to see if cell has either X or O
  end
  
  def valid_move?(u_input)
    !taken?(u_input) && (u_input.to_i-1).between?(0, 8) 
    #checks to see if cell is taken? AND if input is between 0,8 
  end
  
  def update(u_input, player)
    @cells[u_input.to_i-1] = player.token
  end
  
  

end