class Board

  attr_accessor :cells

  def initialize
    # resets the cells of the board to a 9 element array of ' '
    reset!
  end

  def reset!
    # reset the state of the cells in the board to a 9 element array of ' '
    @cells = Array.new(9, ' ')
  end

  def display
    # prints the board
    puts "\n #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} \n\n"
  end

  def position(input)
    # takes user input and returns the value of the board cell
    cells[input.to_i-1]
  end

  def cells_filled?
    # returns an array of the tokens that have been played
    cells.find_all {|cell| cell == 'X' || cell == 'O'}
  end

  def turn_count
    # returns the number of turns taken based on filled cells
    cells_filled?.size
  end

  def full?
    # returns true for a full board, false for an in-progress game
    turn_count == cells.size
  end

  def taken?(input)
    # returns true if the position is X or O
    position(input) == 'X' || position(input) == 'O'
  end

  def valid_move?(input)
    # returns true for user input between 1-9 that is not taken
    input.to_i.between?(1,cells.size) && !taken?(input)
  end

  def available_moves_for_computer
    # returns an array of possible moves in terms the computer can understand (0-8)
    available = []
    cells.each_with_index { |cell, idx| available << idx if cell == " "}
    available
  end

  def available_moves
    # returns an array of possible moves in terms the user can understand ("1"-"9")
    available = []
    available_moves_for_computer.each { |move| available << (move+1).to_s }
    available
  end

  def update(input, player_object)
    # takes position and player object, updates board with player_object.token
    cells[input.to_i-1] = player_object.token
  end

end