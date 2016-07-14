require "pry"

class Board
  attr_accessor :cells

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

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def position position
    position = position.to_i - 1
    @cells[position]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

  def taken? position
    position = position.to_i - 1
    @cells[position] == " " ? false : true
  end

  def valid_move? position
    index = position.to_i - 1
    index >= 0 && index < 9 && !taken?(position) ? true : false
  end

  def update position, player
    position = position.to_i - 1
    @cells[position] = player.token
  end


end