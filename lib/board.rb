class Board
  attr_accessor :cells

   def initialize
     reset!
   end

  def reset!
    @cells = Array.new(9, " ")
  end

  # A board can print its current state with the `#display` method.
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  # You'll also build a `#position` method that takes in the user's input
  # in the form of 1-9 strings like "2" or "9" and looks up the value of the
  # cells at the correct index from the array's perspective. All other methods
  # will take input in the user's perspective of 1-9 strings and use `#position`
  # to look up the value according to the cells' array index.
  def position(pos)
    @cells[pos.to_i - 1]
  end


  # represents updating the board when a player makes a move. This method
  # will take two arguments, the first will be the position the user wants
  # to occupy in the form of 1-9 strings that you will need to convert to the
  #  board cells' array index, along with the player object making the move.
  # When you update the appropriate index in the cells, you will set it equal
  # to the token of the player object by calling the `#token` method on the player.
  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end

  # return values based on its state such as `#full?` when entirely occupied with "X" and "O"s
  def full?
    @cells.all? { |cell| cell == "X" || cell == "O" }

    #if @cells.include?(" ") || @cells.include?(nil)
      #false
    #else
      #true
    #end
  end

  # based on how many positions in the cells array are filled
  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  # will return true or false for an individual position.
  def taken?(pos)
    position(pos) == "X" || position(pos) == "O"
  end

  # returns true for user input between 1-9 that is not taken
  def valid_move?(pos)
    pos.to_i.between?(1,9) && !(taken?(pos))
  end

end
