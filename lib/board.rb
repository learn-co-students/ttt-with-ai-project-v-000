require 'pry'

class Board
  attr_accessor :cells

  def initialize
    # sets the cells of the board to a 9 element array of " "
    @cells = Array.new(9, " ")
  end

  def reset!
    # can reset the state of the cells in the board
    # sets the cells of the board to a 9 element array of " "
    self.cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    # prints the board
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input)
    # takes in user input and returns the value of the board cell
    if user_input.to_i.between?(1,9)
      self.cells[user_input.to_i - 1]
    end
  end

  def full?
    # returns true for a full board
    # 'returns false for an in-progress game'
    # if one of the cells is " " the game is in progress, if not that board is full
    self.cells.detect { |is_position_an_empty_string| is_position_an_empty_string == " " } ? false : true
  end

  def turn_count
    # returns the amount of turns based on cell value
    # the method iteratres through the cells array, if the position has an X or an O it'll add it to our turn count tracker,
    # if it doesn't, it doesn't add anything.
    turn_count = 0
    self.cells.each { |x_o_or_empty_string| x_o_or_empty_string == " " ? turn_count : turn_count += 1 }
    turn_count
  end

  def taken?(position)
    # returns true if the position is X or O
    # returns false if the position is empty or blank
    # Checks to see if the position is an string or has a value of X or O.
    self.cells[position.to_i - 1] == " " ? false : true
  end

  def valid_move?(move)
    # returns true for user input between 1-9 that is not taken
    # If the posision taken comes back as false that means the position is empty and it's a valid move
      self.taken?(move.to_i) == false ? true : false unless move.to_i.between?(1,9) == false
  end

  def update(position, player)
    # updates the cells in the board with the player token according to the input
    # binding.pry
    self.cells[position.to_i - 1] = player.token
  end
end
