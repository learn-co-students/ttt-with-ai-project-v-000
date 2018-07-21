class Board

  attr_accessor :board, :cells

  def initialize(board = nil)
      #should start with cells for a new game of Tic-tac-toe. You can and should use #reset!.
      @board = board || reset!
  end

  def self.cells
    #stores the data of the state of the board in an array.
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def  reset!
    #can reset the state of the cells to what a board should look like at the start of a game, an array with 9 " " elements
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    # board can print its current state with the #display method.
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    #takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the
    #correct index from the array's perspective.
    input = input.to_i - 1
    @cells[input]
    #All other methods will take input in the user's perspective of 1-9 strings and use #position to look up the value according to the cells' array index
  end

  def update(input,player_object)
    #represents updating the board when a player makes a move.
    #will take two arguments, the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert
    #to the board cells' array index, along with the player object making the move.
  @cells[input.to_i - 1] = player_object.token if taken?(input) == false
  end

#  def token
    #When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the #token method
    #on the player.
#  end

  def full?
    # board can return values based on its state such as #full? when entirely occupied with "X" and "O"s
    cells.all? {|space| space == "X" || space == "O"}
  end

  def turn_count
    #count based on how many positions in the cells array are filled.
   @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    #will return true or false for an individual position
    if position(input) == "X" ||  position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    #will ensure that moves are between 1-9 and not taken.
  input.to_i > 0 && input.to_i < 10 && !taken?(input)
  end




end
