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
  def position(digit)
    num = digit.to_i - 1
    @cells[num]
  end
  def full?
    flag = true
    @cells.each do |cell|
      if cell == " "
        flag = false
      elsif cell != "X" && cell != "O"
        flag = false
      end
    end
    flag

  end

  def turn_count
    count = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        count = count + 1
      end
    end
    count
  end
  def taken?(digit)
    num = digit.to_i - 1
    if @cells[num] != "X" && @cells[num] != "O"
      false
    else
      true
    end
  end
  def valid_move?(digit)
      num = digit.to_i
      if taken?(digit) == true
        false
      elsif num == 0
        false
      elsif num > 9
        false
      else
        true
      end

  end
  def update(digit, player)
    num = digit.to_i - 1
    if valid_move?(digit)
      @cells[num] = player.token
    end
  end

end
