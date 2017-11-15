class Board
  attr_accessor :cells, :token

  def initialize
    # Starts a new game with an empty board
    reset!
  end

  def reset!
    # Resets a game to an empty board
    @cells = Array.new(9, " ")
  end

  def display
    # Displays the current tic-tac-toe game with the appropriate Xs and Os
    puts " #{@cells[0]} " "|" " #{@cells[1]} " "|" " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " "|" " #{@cells[4]} " "|" " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " "|" " #{@cells[7]} " "|" " #{@cells[8]} "
  end

  def position(cell)
    # Converts from starting number 1 (as given by player) to starting number 0 (as read by the program)
    cell = cell.to_i
    index = cell - 1
    @cells[index]
  end

  def full?
    # Returns true if all of the cells have either an X or O
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    # Counts how many cells have an X or O
    @cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(cell)
    # Returns true if a particular cell has an X or O in it
    position(cell) == "X" || position(cell) == "O"
  end

  def valid_move?(cell)
    # Checks if a valid cell number was given and whether that cell was taken.  Returns true if its a valid move.
    index = cell.to_i - 1
    index.between?(0,8) && !taken?(cell)
  end

  def update(cell, player)
    # Updates the cell with the player's X or O.
    cell = cell.to_i - 1
    @cells[cell] = player.token
  end

end
