#data and logic of the Tic Tac Toe game board
#board state held in @cells(Array)

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #holds the current state of the game @cells
  end

  def reset!
   self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #clears all tokens from the game @cells
  end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  def position(pos_from_user)
    position = pos_from_user.to_i - 1 #decreases num from user to match array indices
    @cells[position] #returns value from position
  end

  def full?
    full = @cells.any? {|position| position == " "} #if any position us empty returns true
    full ? false : true #if any position is empty, full == true and #full? returns false
  end

  def turn_count
    empty = @cells.count {|position| position == " "} #returns number of empty positions
    turns_taken = 9 - empty #returns number of non-empty positions (turns taken)
  end

  def taken?(pos_from_user)
    self.position(pos_from_user) != " " #returns true if the position is occupied (not empty)
    # if X or O --> true
    # if empty --> false
  end

  def valid_move?(pos_from_user) #returns true for user input between 1-9 that is not taken
    if pos_from_user.to_i.between?(1,9) && self.taken?(pos_from_user) == false
      true
    end
  end

  def update(pos_from_user,player) #updates the cells in the board with the player token according to the input
    @cells[pos_from_user.to_i - 1] = player.token
  end

end
