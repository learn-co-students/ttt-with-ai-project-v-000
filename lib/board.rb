require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    position = position.to_i - 1
    @cells[position]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end

  def valid_move?(position)
    pos = position.to_i - 1

    if taken?(position) == false && pos.between?(0, @cells.length-1)
      true
    else
      false
    end
  end

  def taken?(position)
    position = position.to_i - 1    
    if @cells[position] == " " || @cells[position] == "" || @cells[position] == nil
      return false
    else
      return true
    end
  end

  def update(position, player)
    if not taken?(position)
      @cells[position.to_i-1] = player.token
    end
  end

end
