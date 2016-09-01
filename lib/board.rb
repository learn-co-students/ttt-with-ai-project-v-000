#The `Board` class represents the data and logic of a Tic Tac Toe game board.
class Board

  #It has a property, `cells`, that stores the data of the state of the board in an array.

  def reset!
    @@cells = [" "," "," "," "," "," "," "," "," "]
    #can reset the state of the cells to what a board should look like at the start of a game, an array with 9 `" "` elements.
  end

  def initialize
    reset!
    #When a board is initialized, it should start with cells for a new game of Tic Tac Toe. You can and should use `#reset!`.
  end

  def display
    @@cells
    #A board can print its current state with the `#display` method.
  end

  def position(input_string)
    #You'll also build a `#position` method that takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective. All other methods will take input in the user's perspective of 1-9 strings AND USE `#POSITION` TO LOOK UP THE VALUE ACCORDING TO THE CELLS' ARRAY INDEX.
  end

  def update(input_string, object)
    position(input_string)
    token(object, index(?)) => "set [the array index] equal to the token of the player object"
    #Similarly, you're going to build an `#update` method that represents updating the board when a player makes a move. This method will take two arguments, the first will be the POSITION the user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index, along with the player object making the move. When you update the appropriate index in the cells, you will set it equal to the token of the player object BY CALLING THE `#TOKEN` METHOD ON THE PLAYER.
  end

  def token(object, index(?))
    #set the appropriate index equal to the token of the player object
  end

  def full?
    #TRUE when entirely occupied with "X" and "O"s
  end

  def turn_count
    #based on how many positions in the cells array are filled.
  end

  def taken?
    #will return TRUE OR FALSE for an individual position.
  end

  def valid_move?
    #will ensure that moves are between 1-9 AND not taken.
  end
end
