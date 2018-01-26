class Board
  #represents the data and logic of a Tic Tac Toe game board.

  attr_accessor :cells

  #has a property cells that stores the data of the state of the board in an array


  def initialize()
    #use #reset to set the cells for a new game
    reset!
  end

  def reset!
    # #reset! method can reset the state of the cells to what a board should look like at start of game
    # an array with 9 " " elements
    @cells = Array.new(9, " ")

  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    #takes in a users input in the form of 1-9 strings
    #looks up the value of the cells at the correct index from array
    cells[input.to_i - 1]
  end

  def full?
    cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    cells.count {|token| token == "X" || token == "O"}
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def update(input, player)
    cells[input.to_i-1]= player.token
  end
end
