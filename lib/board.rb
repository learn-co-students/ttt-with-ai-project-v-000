class Board
  attr_accessor :cells
    #has an attribute to store the cells of the board

  def cells
    @cells = []
  end

  def reset!
    #can reset the state of the cells in the board
    #sets the cells of the board to a 9 element array of " "
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def initialize
    reset!
    #sets the cells of the board to a 9 element array of " "
  end

  def display
    #prints the board
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} \n"
    puts "-----------\n"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} \n"
    puts "-----------\n"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} \n"
  end

  def position
    #takes in user input and returns the value of the board cell
    self.cells[gets.chomp.to_1 - 1]
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
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    else board[index] == "X" || board[index] == "O"
      return true
    end
  end

  def valid_move?
    #returns true for user input between 1-9 that is not taken
    if index.between?(0, 8) && !taken?(board, index)
      return true
    else false
    end
  end

  def update
    #updates the cells in the board with the player token according to the input
  end
end
