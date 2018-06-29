require 'pry'
class Board
#  include Player::InstanceMethods
  attr_accessor :cells, :token
  @@cells = []

  def initialize
    reset!
  end

  def reset!
    @cells = [" " , " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    #show current state of board using @@cells
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(string)
    #return value at index(string.to_i-1) in @@cells
    input = string.to_i - 1
    @cells[input]
  end

  def full?
    if @cells.detect {|c| c == " "}
      false
    else
      true
    end
  end

  def turn_count
    @cells.count {|char| char == "X" || char == "O"}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, current_player)
    @cells[index.to_i-1] = current_player.token
  end
end
