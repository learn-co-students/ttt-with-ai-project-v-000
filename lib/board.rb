class Board

  attr_accessor :cells
  #data and logic of the tictactoe board, stores state of board
  
  def initialize
    @cells = reset!
  end
  
  #reset! clears the board
  def reset!
    self.cells = Array.new(9, " ")
  end
  
  #displays board using @cells array
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts " "
  end
  
  #position => input strings, 1 - 9 checks array. returns what is present there 
  def position(player_input)
    cells[move_to_index(player_input)]
  end
  
  # update => update array , two args position to be taken and the player obj
  def update(position, player)
      cells[move_to_index(position)] = player.token
  end
  
  def move_to_index(input)
    input.to_i - 1 
  end

  ## validation methods ##

  #full?
  def full?
    cells.all?{|cell| cell == "X" || cell == "O"}
  end
  
  #turn_count
  def turn_count
    cells.count{ |token| token == "X" || token == "O"}
  end
  
  # position taken?
  def taken?(move)
    !(cells[move_to_index(move)] == " ")
  end
  
  #valid_move?
  def valid_move?(move)
    move_to_index(move).between?(0,8) && !taken?(move)
  end

end
