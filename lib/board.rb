class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  # Resets the state of the cells in the board to a 9 element array of " ".
  def reset!
    @cells = Array.new(9, " ")
  end

  # Prints the board.
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts " "
  end

  # Takes in user input and returns the value of the board cell.
  def position(position)
    @cells[position.to_i-1]
  end

  # Returns true for a full board,returns false for an in-progress game.
  def full?
    !@cells.include?(" ")
  end

  # Returns the amount of turns based on cell value.
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  # Returns true for user input between 1-9 that is not taken.
  def valid_move?(position)
    (position.to_i).between?(1,9) && !(taken?(position))
  end

  # Returns true if the position is X or O, returns false if the position is empty or blank.
  def taken?(position)
    @cells[position.to_i-1] != " " && @cells[position.to_i-1] != ""
  end

  # Updates the cells in the board with the player token according to the input.
  def update(position, player)
    @cells[position.to_i-1] = player.token
  end
end
