require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(space)
    input = (space.to_i - 1)
    cells[input]
  end

  def full?
    return true if !@cells.include?(" ")
  end

  def turn_count
    turn = 0
    @cells.each {|cell| turn += 1 if cell == "X" || cell == "O"}
    turn
  end

  def taken?(space)
    input = space.to_i - 1
    return true if cells[input] != " "
    return false if cells[input] == " "
  end

  def valid_move?(space)
    input = space.to_i

    if input > 0 && input < 10 && taken?(input) == false
      true
    else
      false
    end
  end

  def update(space, player)
    input = space.to_i - 1
    if player == "player"
      token = "O"
    else
      token = "X"
    end
    cells[input] = token
  end


end
