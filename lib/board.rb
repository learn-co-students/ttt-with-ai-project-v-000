class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
     puts "-----------"
     puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
     puts "-----------"
     puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
   end

  def position(input) #position takes in user input and returns the value of the board cell
    cells[input.to_i - 1]
  end

  def full? #full? returns true for a full board, returns false for an in-progress game
    @cells.all? {|positions| positions == "X" || positions == "O"}
  end

  def turn_count #returns the amount of turns based on cell value
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(input) #taken? returns true if the position is X or O, returns false if the position is empty or blank
    index = input.to_i - 1
    if @cells[index] == "X" || @cells[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input) #valid_move? returns true for user input between 1-9 that is not taken
    index = input.to_i - 1
    index.between?(0,8) && !taken?(input)
  end

  def update(input, value) #updates the cells in the board with the player token according to the input
    index = input.to_i - 1
    @cells[index] = player.token
  end
end
