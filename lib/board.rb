require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position(position)
    cells[position.to_i-1]
  end

  def full?
    cells.all?{|x| x!= " "}
  end

  def turn_count
    taken = cells.find_all{|x| x=="O" || x=="X"}
    taken.count
  end

  def taken?position
    if position(position) == "X" || position(position) == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.to_i >= 1 && position.to_i <= 9 && taken?(position) == false
      true
    else
      false
    end
  end

  def update(position, player)
    cells[position.to_i-1] = player.token
  end
end
