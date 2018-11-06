class Board

  attr_accesor :board

  def board=(board)
     @board =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def cells
     @board
  end

  def reset!
  end

  def display #shows current state
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position #takes uers input inform of 1-9
  end

  def update
  end

  def token
  end

  def full?
  end

  def turn_count
  end

  def valid_move?
  end


end #ends class
