class Board
  attr_accessor :cells, :position_index
  @cells = []

  def reset!
    # sets the value of each element in cells array to " "
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    # prints the board in its current state
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position_string)
    # takes user input as a number in a string, "2", and finds corresponding array index
    @position_index = position_string.delete('"').to_i - 1
    cells[position_index]
  end

  def update(position_string, player)
    if !taken?(position_string)
      cells[position_index] = player.token
    end
  end

  def full?
    cells.all? { |index| index == "X" || index == "O"}
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(position_string)
    # position(position_string) will return the contents of the cell in question
    # if the cell does not equal an empty string, it is taken
    position(position_string) != " "
  end

  def valid_move?(position_string)
    !taken?(position_string) && position_index.between?(0, 8)
  end
end
