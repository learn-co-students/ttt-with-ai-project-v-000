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

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #display method - a board can print its current state

  #position method - takes in the user's input in the form of 1-9 strings
  #like "2" or "9" and looks up the value of the cells at the correct index
  #from the array's perspective.
  #All other methods will take input in the user's perspective of 1-9 strings
  #and use #position to look up the value according to the cells' array index.

end
