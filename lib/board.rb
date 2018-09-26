class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def input_to_i(input)
    input.to_i - 1            #converts input to index
  end

  def position(input)         #returns value at position
    cells[input_to_i(input)]
  end

  def taken?(input)           #assesses whether a position contains X or O
    position(input) == "X" || position(input) == "O"
  end

  def full?                   #checks if none of the cells are empty
    cells.none? { |cell| cell == " " }
  end

  def turn_count              #counts the number of filled cells
    cells.select { |cell| cell != " " }.size
  end

  def valid_move?(input)      #checks if input is valid and position is empty
    (1..9) === input.to_i && !taken?(input)
  end

  def update(input, player)   #moves player's token to position
    cells[input_to_i(input)] = player.token
  end
end
