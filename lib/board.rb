class Board
  attr_accessor :cells

  #initiazies board as 9 element array with blank spaces
  def initialize
    self.reset!
  end

  #displays board in a traditional tic tac toe fashion
  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  #takes in input and returns that value of the cell in the board
  def position(input)
    player_position = input.to_i - 1
    @cells[player_position]
  end

  #updates the board with the player's token at the desired position
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  #checks if the board has any open spaces
  def full?
    if @cells.include?(" ")
      return false
    end
    return true
  end

  #counts how many turns there have been by checking for "X" or "O" in cells
  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  #determines wether the input given is a valid move on the board by first checking if its a number between 1-9
  #and then checks if that space is taken
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  #clears the board
  def reset!
    @cells = Array.new(9," ")
  end

  #checks if the desired move is open
  def taken?(input)
    if position(input) != " "
      return true
    end
    return false
  end

end
