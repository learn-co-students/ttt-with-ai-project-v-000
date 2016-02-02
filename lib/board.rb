require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  #resets board
  def reset!
    @cells.clear
    9.times do
      @cells.push(" ")
    end
    @cells
  end

  #display board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #returns board position given user input
  def position(position)
    @cells[position.to_i-1]
  end

  #returns boolean if board is full or not
  def full?
    return false if @cells.include?(" ")
    else true
  end

  #returns how many turns have been taken.
  def turn_count
    @cells.count{|i| i != " "}
  end

  #returns boolean if position on the board is taken.
  def taken?(position)
    return false if @cells[position.to_i-1] == " "
    else true
  end

  #returns boolean if move is a valid move e.g. if the array index is " ", and not an X or O.
  def valid_move?(position)
    if position.to_i.between?(1,9)
    return true if @cells[position.to_i-1] == " "
    else false
    end
  end

  #updates board with players token.
  def update(position, player)
    @cells[position.to_i-1] = player.token
  end

end
