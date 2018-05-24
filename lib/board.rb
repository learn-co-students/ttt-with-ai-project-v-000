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
    !@cells.include?(" ")
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

  def input_to_index(space)
    space.to_i - 1
  end

  def update(space, player)
    if valid_move?(space)
      space_index = input_to_index(space)
      @cells[space_index] = player.token
    end
  end


end
