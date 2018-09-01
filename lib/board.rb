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

  def position(input)
    cells[input.to_i - 1]
  end

  def full? #checks to see if all the spaces are filled with either x or o
    cells.all? {|character| character == "X" || character == "O"}
  end

  def turn_count # counts for x and o
    cells.count{|char|char == "X" || char == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input) # returns true for user input between 1-9 that is not taken
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input,player) # updates the cells in the board with the player token according to the input
    cells[input.to_i - 1] = player.token
  end

end
