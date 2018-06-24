class Board
   #represents the data and logic of a Tic Tac Toe game board.

   attr_accessor :cells

   #has a property cells that stores the data of the state of the board in an array


   def initialize()
     #use #reset to set the cells for a new game
     reset!
   end

   def reset!
     # #reset! method can reset the state of the cells to what a board should look like at start of game
     # an array with 9 " " elements
     @cells = Array.new(9," ")

   end

   #displays the board in the window
   def display
     puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
     puts "-----------"
     puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
     puts "-----------"
     puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
     puts "*****************************************"
     puts "*****************************************"
   end

   def position(input)
     #takes in a users input in the form of 1-9 strings
     #looks up the value of the cells at the correct index from array
     cells[input.to_i - 1]
   end

   #verifying all cells are filled with X or O
   def full?
     cells.all? {|token| token == "X" || token == "O"}
   end

   #counting how many cells are taken by X or O
   def turn_count
     cells.count {|token| token == "X" || token == "O"}
   end

   #checks that the input is between 1 and 9
   #checks to verify that the cell is not taken
   def valid_move?(input)
     input.to_i.between?(1,9) && !taken?(input)
   end

   #returns true or false for an individual position
   #if position is not blank with a space or no space => taken
   def taken?(input)
     position(input) != " "
   end

 #updates board when player moves
 #sets the cell equal to the players token
   def update(input, player)
     cells[input.to_i-1]= player.token
   end
 end
