class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    # board can print its current state
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    # takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective
    @cells[input.to_i - 1]
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  def full?
    # entirely occupied with "X" and "O"s
    turn_count == 9
  end

  def turn_count
    # based on how many positions in the cells array are filled
    @cells.count("X") + @cells.count("O")
  end

  def taken?(input)
    # return true or false for an individual position
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    # ensure that moves are between 1-9 and not taken
    input.to_i.between?(1,9) && taken?(input) == false
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
end
