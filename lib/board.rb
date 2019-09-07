require'pry'

class Board
  attr_accessor :cells
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    !@cells.any?{|cell| cell == " "}
  end

  def turn_count
    9-@cells.count(" ")
  end

  def taken? (i)
    !(position(i) == " " || position(i) == "")
  end

  def valid_move?(i)
    i.to_i.between?(1,9) && !taken?(i)
  end

  def update(i, player)
    @cells[i.to_i-1] = player.token
  end
end
