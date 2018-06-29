class Board
  attr_accessor :cells

  def initialize
      reset!
  end

  def reset!
    @cells = Array.new(9, " " )
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]#taking cell array and changing it to an intg
  end

  def full?
    @cells.all? {|position| position == "X" || position == "O"} #looks through all cells, iterates through each. does the character equal X? or O? if not, returns false. If there is a character then it returns true.
  end

  def turn_count
    @cells.count {|item| item == "X" || item == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    #we want to know if user input is between 1-9 (0-8). Then make sure not taken
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    #updates the cells in the board with the player token according to the input
    #takes input (X or O) from cells array, converted to integer and and calling player.token for the token
    cells[input.to_i - 1] = player.token
    #turn_count.even?(input) == "X"
  end
end
