class Board
  attr_accessor :cells

  #Initializes an empty board
  def initialize
    reset!
  end

  #Resets a board, called when a board is initialized
  def reset!
    @cells = Array.new(9, " ")
  end

  #Displays a board 
  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #Takes a users input, and associates it with the proper cell value
  def position(input)
    cells[input.to_i-1]
  end

  #When a player inputs a position, updates the 
  #cell/array to contain that players token
  def update(input, player)
    cells[input.to_i-1] = player.token
  end

  #Checks the cell array to see if all positions are filled with tokens
  def full?
    cells.all?{|token| token == "X" || token == "O"}
  end


  #Counts the number of tokens to know the turn count
  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  #Checks to see if a position has a token
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  #Checks to make sure player input is not taken and is 1-9
  def valid_move?(input)
    if input.to_i.between?(1, 9)
      if taken?(input)
        return false
      end
      return true
    end
    return false
  end
end