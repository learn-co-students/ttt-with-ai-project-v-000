class Board

  attr_accessor :cells
# initialized with empty cells
  def initialize
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # Reset instead of making the new board
    self.reset!
  end
# reset the state of the cells in the board
# make a new array instead of 2 steps
  def reset!
    # self.cells.clear
    # self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    Array.new(9, " ")
  end
# prints the board
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "--------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "--------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  # must check if board is full?
  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}

  end
# takes in user input and returns the value of the board cell
  def position(num)
    case num

    when "1"
      cells[0]
    when "2"
      cells[1]
    when "3"
      cells[2]
    when "4"
      cells[3]
    when "5"
      cells[4]
    when "6"
      cells[5]
    when "7"
      cells[6]
    when "8"
      cells[7]
    when "9"
      cells[8]
    end
  end
# returns true for a full board
# returns false for an in-progress game
  def full?
    !self.cells.include?(" ")
  end
# returns the amount of turns based on cell value
  def turn_count
    9 - self.cells.count(" ")
  end
# returns true if the position is X or O
# returns false if the position is empty or blank
  def taken?(num)
    if position(num) == "X" || position(num) == "O"
      true
    else
      false
    end
  end

  def num_check(num)
    a = (1..9).to_a
    a.include?(num.to_i)
  end
# returns true for user input between 1-9 that is not taken
  def valid_move?(num)
    true unless taken?(num) || !num_check(num)
  end
# updates the cells in the board with the player token according to the input
# Returns the new piece on the board
  def update(num, player_obj)
    self.cells[num.to_i - 1] = player_obj.token
  end
end
