require 'pry'

class Board

attr_accessor :cells

  def initialize #clears the board
    reset!
  end

  def reset! # resets board
    @cells = Array.new(9, " ")
  end

  def display #display board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input) # takes user input and returns value of board cell
    cells[input.to_i-1]
  end

  def full? # returns true for full and false for in-progress
    cells.all? {|character| character == "X" || character == "O"}
  end

  def turn_count # returns amt of turns based on cell value
    cells.count {|char| char == "X" || char == "O"}
  end

  def taken?(input) #position X or O and false if empty
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input) # returns true input between 1-9 and not taken
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player) # updates cells in board with player token according to input
    cells[input.to_i-1] = player.token #token represents X or O
  end
end
