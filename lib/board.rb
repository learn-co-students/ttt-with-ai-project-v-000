
# token method - set it equal to the token of the player object



#Board class represents the data and logic of a Tic-tac-toe game Board
class Board
  #Propert CELL - Stores Data of the state of the board in an Array
  attr_accessor :cells
  
  @cells = []
  
  #When board is initializes it should with cells from a new game - USE #reset!
  def initialize
    reset!
  end  
  
  #Reset! Method - can reset the state of the cells to what a board should look like at the start of the of the game an array with 9 " " elements
  def reset!
    self.cells = Array.new(9, " ")
  end 
  
  #display method - A board can print its current state
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end 
  
  # position method takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective. All other methods will take input in the user's perspective of 1-9 strings and use #position 
  def position(user_input)
    return self.cells[user_input.to_i - 1]
  end
  
  
# The board can return values based on its state suh as full? when enrtirely occupied with "X" and "O"
  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  # Turn_count can return values based on how many positions in the cell array are filled.
  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end  
  
  #taken? will return true or false for an individual position.
  def taken?(position)
    #board position -1 because of test using range 1-9 (user input numbers)
    self.cells[position.to_i-1] == "X" || 
    self.cells[position.to_i-1] == "O"
  end
  
  #valid_move? will ensure that moves are between 1-9 and not taken
  def valid_move?(position)
    !taken?(position) && position.to_i >0 && position.to_i <=9
  end
  
  # Update method represents updating the board when player makes a move. Takes two arguments 1st - The position a user wants to occupy in the form of 1-9 strings that will be converted to the board cell's array index and 2nd the player object making the move.
  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end
  
end  
  


