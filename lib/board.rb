require 'pry'
##
# => This handles the behavior of the board
##
class Board
  # => Sets the cells getter and setter
  attr_accessor :cells

  ##
  # => This instantiates a new board with a fresh grid
  ##
  def initialize
    reset!;
  end

  ##
  # => Creates a fresh grid for a board
  ##
  def reset!
    @cells = Array.new(9, " ")
  end

  ##
  # => Displays the current state of the board
  ##
  def display
    #puts "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    #puts "-----------"
  end

  ##
  # => This determines the position the player wants on the board given their input
  ##
  def position(input)
    @cells[input.to_i - 1]
  end

  ##
  # => This places the player token on the board
  ##
  def update(input, player)
    @cells[input.to_i - 1] =  player.token;
  end

  ##
  # => This checks if the board is full or now
  ##
  def full?
    !@cells.include?(" ");
  end

  ##
  # => This determines how many turns have been taken
  ##
  def turn_count
    count = 9 - @cells.count(" ");
  end

  ##
  # => This checks a given position on the board to see if it's taken or not
  ##
  def taken?(input)
   !(position(input) == " " || position(input) == "" )
  end

  ##
  # => This checks whether or not a given move is valid
  ##
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input);
  end
end
