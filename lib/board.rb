require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end



  def position(i)
    index = i.to_i - 1
    @cells[index]
  end

  #want the condition to evaluate to true
  def full?
    cells.each do | position |
      if position == " "
        return false
      end
    end
  end


  def turn_count
    cells.count {|position| position !=" "}
  end

#evaluates player next move position and returns true if the position is X or O'
  def taken?(a)
    index = a.to_i - 1
    !(@cells[index].nil? || @cells[index] == " ")
  end


  def valid_move?(a)
    index = a.to_i - 1
    index.between?(0,8) && !taken?(a)  ? true : false
  end

  def update(a, player)
    index = a.to_i - 1
    @cells[index] = player.token
  end



end
