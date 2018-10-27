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

  def opposite_corner(input)
    if input == 0
      return '9'
    elsif input == 2
      return '7'
    elsif input == 6
      return '3'
    elsif input == 8
      return '1'
    end
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
    @cells[conversion(input)]
  end

  def full?
    counter = 0
    while counter < 9
      if @cells[counter] == " "
        return false
      end
      counter = counter + 1
    end
    return true
  end

  def game_progress
    counter = 0
    progress = 0
    while counter < 8
      if @cells[counter] == "X" || @cells[counter] == "O"
        progress = progress + 1
      end
      counter = counter + 1
    end
    progress
  end

  def turn_count
    counter = 0
    turncount = 0
    while counter < 9
      if @cells[counter] == "X" || @cells[counter] == "O"
        turncount = turncount + 1
      end
      counter = counter + 1
    end
    turncount
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      return true
    else
      return false
    end
  end

  def not_taken(input)
    if position(input) != "X" && position(input) != "O"
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

  def update(number, player)
    @cells[conversion(number)] = player.token
  end

end
