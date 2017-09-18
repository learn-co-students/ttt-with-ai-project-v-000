class Board
  attr_accessor :cells


# initialized with empty cells

  def initialize
    #
    # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # Reset instead of making the new board
    self.reset!
  end


# reset the state of the cells in the board
# make a new array instead of 2 steps
  def reset!
    #
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
# no reason to make a whole case, all we have to do is return the cell.
  def position(string)
    #
    # case num
    #
    # when "1"
    #   cells[0]
    # when "2"
    #   cells[1]
    # when "3"
    #   cells[2]
    # when "4"
    #   cells[3]
    # when "5"
    #   cells[4]
    # when "6"
    #   cells[5]
    # when "7"
    #   cells[6]
    # when "8"
    #   cells[7]
    # when "9"
    #   cells[8]
    # end
    self.cells[string.to_i - 1]
  end


# returns true for a full board
# returns false for an in-progress game
  def full?
    !self.cells.include?(" ")
  end


# returns the amount of turns based on cell value
# Count for the actual thing I want to find. Not subtract to get it.
# Count for how many pieces put on the board
  def turn_count
    # 9 - self.cells.count(" ")
    self.cells.count{|cell| cell == "X" || cell == "O"}
  end


# returns true if the position is X or O
# returns false if the position is empty or blank
# I need to check if the space is empty. If it is then false
  def taken?(string)
    #
    # if position(num) == "X" || position(num) == "O"
    #   true
    # else
    #   false
    # end
    !self.position(string) == " "
  end

  #
  # def num_check(num)
  #   a = (1..9).to_a
  #   a.include?(num.to_i)
  # end

# returns true for user input between 1-9 that is not taken
# Instead of setting up num check, simply check for valid input with #between?
  def valid_move?(string)
    string.to_i.between?(1,9) && !self.taken?(string)
  end


# updates the cells in the board with the player token according to the input
# Returns the new piece on the board
  def update(string, player_obj)
    self.cells[string.to_i - 1] = player_obj.token
  end
end
