require 'pry'
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def position

  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


  end

  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[ user_input.to_i - 1 ]#takes in user input -- puts/gets returns value of the board cell
  end

  def update

  end

  def full?
    # @cells.any?{|c| c != " "} # ask why doesn't this work?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{ |token| token == "X" || token == "0"}
  end

  def taken(index)
    @cells[index]=="X" || @cells[index]=="O"
  end

  def valid_move(index)
    index.between[0,8] &&  !taken[index]
  end

end
