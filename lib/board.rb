#####cells
#has an attribute to store the cells of the board
#####reset!
#can reset the state of the cells in the board
#sets the cells of the board to a 9 element array of " "                                                                                                           
#####initialize
#sets the cells of the board to a 9 element array of " "
#####display
#prints the board
#####position
#takes in user input and returns the value of the board cell
#####full?
#returns true for a full board
#returns false for an in-progress game
#####turn_count
#returns the amount of turns based on cell value
#####taken?
#returns true if the position is X or O
#returns false if the position is empty or blank
#####valid_move?
#returns true for user input between 1-9 that is not taken
#updates the cells in the board with the player token according to the input

class Board
  attr_accessor :cells
  def initialize
      reset!
  end
  def display

    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def taken?(user_input)
    position(user_input) != " "
  end

  def valid_move?(user_input)
    user_input_to_i = user_input.to_i
    user_input <= "9" && user_input >= "1" && !taken?(user_input)
  end

  def update(user_input, player)
    cells[user_input.to_i-1]=player.token if !taken?(user_input) && valid_move?(user_input)
    display
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.select{|cell| cell != " "}.count
  end

  def reset!
      @cells=Array.new(9," ")
  end
end
