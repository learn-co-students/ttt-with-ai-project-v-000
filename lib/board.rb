require 'pry'

class Board

  # attr_accessor :move
  attr_writer :cells

  def initialize
    # resets the cells of the board to a 9 element array of ' '
    @cells = []
    reset!
  end

  def cells
    # returns the cells of the board
    @cells
  end

  def reset!
    # reset the state of the cells in the board to a 9 element array of ' '
    @cells = Array.new(9, ' ')
  end

  def display
    # prints the board
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    # takes in user input and returns the value of the board cell
    cells[user_input.to_i-1]
  end

  def full?
    # returns true for a full board, false for an in-progress game
    cells.all? {|position| position == 'X' || position == 'O'}
  end

  def turn_count
    # returns the number of turns taken based on cell value
    cells.count {|position| position == 'X' || position == 'O'}
  end

  def taken?(position)
    # returns true if the position is X or O
    cells[position.to_i-1] == 'X' || cells[position.to_i-1] == 'O'
  end

  def valid_move?(user_input)
    # returns true for user input between 1-9 that is not taken
    user_input.to_i.between?(1,9) && !taken?(user_input)
  end

  def update(position, player)
    # updates the cells with the player token according to the input
    cells[position.to_i-1] = player
  end


end