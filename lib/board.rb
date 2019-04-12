class Board
  attr_accessor :cells

  @cells = [] #store cells of board

  def reset! #reset state of cells to game start
    self.cells = Array.new(9, " ")
  end

  def initialize #beginning board
    self.reset!
  end

  def display #prints the board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts '-----------'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '-----------'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input) #user input to board cell
    self.cells[user_input.to_i-1]
  end

  def full? #returns true if board is full
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count #amount of turns
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(user_input) #checks if cell is taken
    self.position(user_input) == "X" || self.position(user_input) == "O"
  end

  def valid_move?(user_input) #checks user input between 1-9 & cell not taken
    cell_value = user_input.to_i-1
    cell_value.between?(0,8) && !self.taken?(user_input)
  end

  def update(user_input, player) #updates cells in board with player token according to input
   self.cells[user_input.to_i-1] = player.token
  end

end
