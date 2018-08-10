require 'pry'

class Board
  attr_accessor :cells #Need to create a @cells instance var and need to be able to get/set this attribute (an attribute of board).

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ") #@Cells gets set to a new array with 9 blank spaces when the reset method is called.
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)  #Positive given (minus 1) equal to that specifc index of @cells. Returns VALUE (not the index number!) of the board cell
    input = input.to_i - 1
    cells.fetch(input)
    #cells[input.to_i-1] (another way to solve this method)
  end

  def full? #If all indexes are filled, TRUE, game over, board = full. If some (or all) positions empty, game NOT over, board NOT full.
    cells.all? {| index| index == "X" || index == "O"}
  end

  def turn_count
    cells.count {|index| index == "O" || index == "X"}
  end

  def taken?(input) #Returns TRUE if the index is filled with a value.
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player) #input 1-9 and player X or O
    #player = double("player", :token => "X")
    cells[input.to_i-1] = player.token
  end


end
