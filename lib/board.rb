class Board
  attr_accessor :cells
    #has an attribute to store the cells of the board

    @cells = []

  def reset!
    #can reset the state of the cells in the board
    #sets the cells of the board to a 9 element array of " "
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

  def position(input)
    #takes in user input and returns the value of the board cell
    self.cells[input.to_i - 1]
  end

  def full?
    #returns true for a full board
    #returns false if the position is empty or blank
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    #returns the amount of turns based on cell value
    self.cells.count {|c| c == "X" || c == "O"}
  end

  def taken?(position)
    #returns true if the position is X or O
    #returns false if the position is empty or blank
    self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
  end

  def valid_move?(position)
    #returns true for user input between 1-9 that is not taken
    (position.to_i - 1).between?(0, 8) && !taken?(position)
  end

  def update(position, player)
    #updates the cells in the board with the player token according to the input
    self.cells[position.to_i - 1] = player.token
  end
end
