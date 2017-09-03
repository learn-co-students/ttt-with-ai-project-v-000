require 'pry'

class Board

  def cells
    @cells
  end

  def cells=(cells)
    @cells = cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def conversion(input)
    number = input.to_i - 1
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
    counter = 0
    while counter <= 8
      if @cells[counter] == " "
        return false
      end
      counter = counter + 1
    end
    return true
  end

  def turn_count
    counter = 0
    turncount = 0
    while counter < 8
      if @cells[counter] == " "
        turncount = turncount + 1
      end
      counter = counter + 1
    end
    9 - turncount
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if conversion(input) < 0
      return false
    elsif conversion(input) > 8
      return false
    elsif taken?(input) == false
      return true
    else
      return false
    end
  end

  def update(number, player)#
    @cells[conversion(number)] = player.token
    #binding.pry
  end

end
