class Board
  attr_accessor :cells

  #sets the cells of the board to a 9 element array of " "
  def initialize
    reset!
  end

  #has an attribute to store the cells of the board
  def cells
    @cells
  end

  #can reset the state of the cells in the board
  #sets the cells of the board to a 9 element array of " "
  def reset!
    #binding.pry
    @cells = Array.new(9, " ")
  end

  #prints the board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #takes in user input and returns the value of the board cell
    #takes in the user's input in the form of 1-9 strings like "2" or "9"
      #and looks up the value of the cells at the correct index from the array's perspective.
  def position(input)
    @cells[input.to_i - 1]
  end

  #returns true for a full board
  #returns false for an in-progress game
  def full?
    @cells.all? do |space|
      if space == "X" || space == "O"
        true
      else space == " "
        false
      end
    end
  end

  #returns the amount of turns based on cell value
  def turn_count
    counter = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        counter +=1
      end
    end
    return counter
  end

  #returns true if the position is X or O
  #returns false if the position is empty or blank
  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    elsif position(input).nil? || position(input) == " "
      false
    end
  end

  #returns true for user input between 1-9 that is not taken
  def valid_move?(input)
    if input.to_i.between?(1, 9)
      if taken?(input) == false
        true
      elsif taken?(input) == true
        false
      end
    else !input.to_i.between?(1, 9)
      false
    end
  end

    #updates the cells in the board with the player token according to the input
      #This method will take two arguments, the first will be the position the user
        #wants to occupy in the form of 1-9 strings that you will need to convert
        #to the board cells' array index, along with the player object making the move.
  def update(input, player)
    #When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the #token method on the player
    position(input).clear << player.token
  end

end
