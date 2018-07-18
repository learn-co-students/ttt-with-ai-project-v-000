class Board

  def initialize(board)
      #should start with cells for a new game of Tic-tac-toe. You can and should use #reset!.
  end

  def self.cells
      #stores the data of the state of the board in an array.
  end

  def  reset!
    #can reset the state of the cells to what a board should look like at the start of a game, an array with 9 " " elements
  end

  def display
    # board can print its current state with the #display method.
  end

  def position(input)
    #takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the
    #correct index from the array's perspective.

    #All other methods will take input in the user's perspective of 1-9 strings and use #position to look up the value according to the cells' array index
  end

  def update(one,two)
    #represents updating the board when a player makes a move.
    #will take two arguments, the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert
    #to the board cells' array index, along with the player object making the move.
  end

  def token
    #When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the #token method
    #on the player.
  end

  def full?
    # board can return values based on its state such as #full? when entirely occupied with "X" and "O"s
  end

  def turn_count
    #count based on how many positions in the cells array are filled.
  end

  def taken?
    #will return true or false for an individual position
  end

  def valid_move?
    #will ensure that moves are between 1-9 and not taken.
  end




end
