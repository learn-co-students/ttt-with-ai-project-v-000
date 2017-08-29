require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
    #start with cells for new game
    #use reset!
  end

  def reset!
    @cells = Array.new(9, " ")
    #can reset the state of the cells to what a board should look like at the start of game, array with nine " " elements.
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    #print the board's current state
  end

  def position(input)
    cells[input.to_i - 1]
    #takes in user's input in the form of 1-9 strings and converts it to a index (integer?) on the board array
  end

  def full?
    cells.all? {|c| c == "X" || c == "O"}
    #entirely occupied with Xs and Os
  end

  def turn_count
    cells.find_all {|c| c == "X" || c == "O"}.size
  end

  def taken?(position)
    cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
    #returns true or false for an individual position
  end

  def valid_move?(position)
    position.to_i.between?(1, 8) && !taken?(position)
    #ensures that moves are between 1-9 and not taken
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
  end

end
