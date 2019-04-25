class Board



  def cells
    #stores data of the state of the board in an Array
    board_data = []
  end

  def reset!
    #reset the state of the cells to what a board should look like at game start with 9 " " elements
    new_board = 
  end

  def display
    #print current state of board
    print board + board_data
  end
  
  def position
    #look up the value according to the cells' array index
    
  end
  
  def update(position, player)
    #represents updating the board when player makes a move
    
    #position user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index
    
    #player object of who's making the move
    
    #update the token method of the player - call it with name space Players::Human or Players::Computer
    
  end 

  def token
    #invoked when saving the update method
    
  end
  
  def full?
    #when entirely occupied by "X"" and "O"s
    
  end
  
  def turn_count
    #how many positions in cells array are filled
    
  end
  
  def taken?
    #returns true or false for a position
  end

  def valid_move?
    #ensures that moves are between 1-9 and not taken(i.e. available)
    
  end
end