class Board
  attr_accessor :cells
  #It has a property, cells, that stores the data of the state of the board in an array.

# When a board is initialized, it should start with cells for a new game of Tic-tac-toe.
# You can and should use #reset!.
# sets the cells of the board to a 9 element array of " "
  def initialize
    reset!
  end

  #can reset the state of the cells in the board
    # sets the cells of the board to a 9 element array of " "
  def reset!
    @cells = Array.new(9, " ")
  end

#A board can print its current state with the #display method.
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

# #position method: takes in the user's input in the form of 1-9 strings like "2" or "9" and
# looks up the value of the cells at the correct index from the array's perspective.
# All other methods will take input in the user's perspective of 1-9 strings and use
#position to look up the value according to the cells' array index.
   # Board #position takes in user input and returns the value of the board
  def position(input)
    cells[input.to_i-1]
  end

#The update method represents updating the board when a player makes a move. This will take two arguments,
# the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index,
# along with the player object making the move. When you update the appropriate index in the cells,
# you will set it equal to the token of the player object by calling the #token method on the player.

  #Board #update updates the cells in the board with the player token according to the input
  def update(input, player)
    cells[input.to_i-1] = player.token
  end

  # The board can return values based on its state such as #full? when entirely occupied with "X" and "O"s and
  # a #turn_count based on how many positions in the cells array are filled. #taken? will return true or
  #false for an individual position.
  def full?
    cells.all? do |token|
      token == "X" || token == "O"
    end
  end

 #turn_count returns the amount of turns based on cell value
  def turn_count
    cells.count do |token|
      token == "X" || token == "O"
    end
  end

  # Board #taken? returns true if the position is X or O
  # Board #taken? returns false if the position is empty or blank
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  #valid_move? will ensure that moves are between 1-9 and not taken.
  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end
end
