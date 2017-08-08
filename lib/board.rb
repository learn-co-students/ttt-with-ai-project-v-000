class Board
  attr_accessor :cells

  #reset board to be 9 empty cells
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    self.reset!
  end

#display board - prints the board in this format X | X | X
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  #position - takes user input and return value of that cell, either X, O, or empty?
  def position(input)
    index = input_to_index(input)
    cells[index]
  end

  #full - returns true for a full board
  def full?
    cells.all?{|cell| cell != " "}
  end

  #turn count, returns the amount of turns based on cell count
  def turn_count
    cells.count{|cell|  cell != " "}
  end

  #taken - returns true if the position is "X"  or "O"
  def taken?(input)
    index = input_to_index(input)
    cells[index] != " "
  end

  #valid move - returns true for user input between 1-9 that is not taken
  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  #update - updates the cells in the board with the player token according to input
  def update(input, player)
    index = input_to_index(input)
    cells[index] = player.token
  end

#end of class
end
