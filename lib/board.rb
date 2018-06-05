class Board #represents the data and logic of a Tic-tac-toe game board
  attr_accessor :cells
  #property cells that stores the data of the state of the board in an array
  @cells = []

  def reset!
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  #reset! method can reset the state of the cells to a what a board should look
  #like at the start of a game, an array with 9 " " elements.

  #display method - a board can print its current state

  #position method - takes in the user's input in the form of 1-9 strings
  #like "2" or "9" and looks up the value of the cells at the correct index
  #from the array's perspective.
  #All other methods will take input in the user's perspective of 1-9 strings
  #and use #position to look up the value according to the cells' array index.

end
