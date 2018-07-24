class Board
  attr_accessor :board, :cells

  def cells
    #has an attribute to store the cells of the board
    @cells = []
  end

  def reset!
    #can reset the state of the cells in the board
    #sets the cells of the board to a 9 element array of " "
    cells.clear
    cells = Array.new(9, " ")
  end

  def initialize
    #sets the cells of the board to a 9 element array of " "
  end

  def display
    #prints the board
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
    puts "-----------\n"
    puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
    puts "-----------\n"
    puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
  end

  def position
    #takes in user input and returns the value of the board cell
  end

  def full?
    #returns true for a full board
    #returns false if the position is empty or blank
  end

  def turn_count
    #returns the amount of turns based on cell value
  end

  def taken?
    #returns true if the position is X or O
    #returns false if the position is empty or blank
  end

  def valid_move?
    #returns true for user input between 1-9 that is not taken
  end

  def update
    #updates the cells in the board with the player token according to the input
  end
end
