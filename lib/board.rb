

class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    #takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective
    input = input.to_i
    @cells[input - 1]
  end

  #All other methods will take input in the user's perspective of 1-9 strings and use #position to look up the value according to the cells' array index

  def full?
    #board can return values based on its state such as #full? when entirely occupied with "X" and "O"s
    #returns false for board with open spaces
    #returns true for full board
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    # how many positions in the cells array are filled
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    #will return true or false for an individual position
    input = input.to_i
    @cells[input - 1] == "X" || @cells[input - 1] == "O"
  end

  def valid_move?(input)
    #will ensure that moves are between 1-9 and not taken.
    input = input.to_i
    input >= 1 && input <= 9 ? !taken?(input) : false
  end

  def update(input, player)
    #represents updating the board when a player makes a move. This method will take two arguments, the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index, along with the player object making the move. When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the #token method on the player.
    input = input.to_i
    @cells[input - 1] = player.token
  end
end
