class Board
  attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # A board can print its current state with the `#display` method.
  def display
  end

  # You'll also build a `#position` method that takes in the user's input
  # in the form of 1-9 strings like "2" or "9" and looks up the value of the
  # cells at the correct index from the array's perspective. All other methods
  # will take input in the user's perspective of 1-9 strings and use `#position`
  # to look up the value according to the cells' array index.
  def position
  end

  # represents updating the board when a player makes a move. This method
  # will take two arguments, the first will be the position the user wants
  # to occupy in the form of 1-9 strings that you will need to convert to the
  #  board cells' array index, along with the player object making the move.
  # When you update the appropriate index in the cells, you will set it equal
  # to the token of the player object by calling the `#token` method on the player.
  def update
  end

  def token
  end

  # return values based on its state such as `#full?` when entirely occupied with "X" and "O"s
  def full?
  end

  # based on how many positions in the cells array are filled
  def turn_count
  end

  # will return true or false for an individual position.
  def taken?
  end

  # will ensure that moves are between 1-9 and not taken.
  def valid_move?
  end




end
