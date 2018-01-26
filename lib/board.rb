class Board
  #represents the data and logic of a Tic Tac Toe game board.

  attr_accessor :cells,

  #has a property cells that stores the data of the state of the board in an array


  def initialize(board)
    #use #reset to set the cells for a new game
    @board = board
    board.reset!
  end

  def reset!
    # #reset! method can reset the state of the cells to what a board should look like at start of game
    # an array with 9 " " elements
    @@board = {" ", " ", " ", " ", " ", " ", " ", " ", " "}

  end

  def display(board)
    @@board

  end

  def position(input)
    #takes in a users input in the form of 1-9 strings
    #looks up the value of the cells at the correct index from array
    input -= get.strips.to_i - 1
  end





end
