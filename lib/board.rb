#data and logic of the Tic Tac Toe game board
#board state held in @cells(Array)

class Board
  attr_accessor :cells

  def initialize
    @cells = [] #holds the current state of the game @cells
    self.reset! #sets @cells to empty board when Board.new invoked
  end

  def reset!
   self.cells = Array.new(9, " ") #clears all tokens from the game @cells
  end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  def position(pos_from_user)
    @cells[pos_from_user.to_i - 1] #decreases num from user to match array indices
  end

  def full?
    full = @cells.all? {|cell| cell != " "} #if any position us empty returns true
    full ? true : false #if any position is empty, full == true and #full? returns false
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(pos_from_user)
    self.position(pos_from_user) != " " #returns true if the position is occupied (not empty)
    # if X or O --> true
    # if empty --> false
  end

  def valid_move?(pos_from_user) #returns true for user input between 1-9 that is not taken
    pos_from_user.to_i.between?(1,9) && self.taken?(pos_from_user) == false
  end

  def update(pos_from_user,player) #updates the cells in the board with the player token according to the input
    @cells[pos_from_user.to_i - 1] = player.token
  end

end
