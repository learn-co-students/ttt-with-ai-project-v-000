class Board
  require 'pry'
  attr_accessor :cells

  def initialize
    reset!
  end

  def position(input) #RETURNS VALUE AT BOARDINDEX FOR INPUT POSITION
    @cells[input.to_i-1]          #converts passed str (perhaps to simulate a user's kb entry) to int, then subtracts 1 to get index, and returns.
  end

  def taken?(input) #CHECKS IF POSITION TAKEN
    position(input) == "X" || position(input) == "O"             #calls above function, evaluates it and returns false if it's an empty cell.
  end

  def valid_move?(input) #CHECKS IF MOVE VALID
    !taken?(input) && input.to_i.between?(1,9)                     #A bit messy. Having to independently convert input to int, and check b/t 1-9
  end

  def update(input, player) #ADDS MOVE TO BOARD     #Should really be: valid_move?(input) ? @cells[input.to_i-1] = player.token : "Invalid move"
    @cells[input.to_i-1] = player.token                                  #sets cells to player token. Only way to get this was via reading spec.
  end

  def turn_count #COUNTS_TURNS
    @cells.each.count {|cell| cell == "X" || cell == "O"}
  end

  def display #PRINTS BOARD. (The cells are the board. Bit unclear.)
    puts [" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "]
    puts                  ["-----------"]
    puts [" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "]
    puts                  ["-----------"]
    puts [" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "]
  end

  def reset! #RESETS CELLS/BOARD
    @cells = Array.new(9, " ")
  end

  def full? #CHECKS IF FULL BOARD.
    !@cells.include?(" ")
  end #binding.pry

end
