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
    print " #{@cells[0]} |"
    print " #{@cells[1]} |"
    puts " #{@cells[2]} "
    puts "-----------"
    print " #{@cells[3]} |"
    print " #{@cells[4]} |" 
    puts " #{@cells[5]} "
    puts "-----------"
    print " #{@cells[6]} |"
    print " #{@cells[7]} |"
    puts " #{@cells[8]} "
  end

  def i_to_i(input)
    return input.to_i - 1
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?()
    @cells.each do |index|
      if index != "X" && index != "O"
        return false
      end
    end
    return true
  end

  def turn_count()
    count = 0
    @cells.each do |i|
      if (i == "X" || i == "O")
        count += 1
      end
    end
    return count
  end

  def taken?(input)
    return !(@cells[i_to_i(input)].nil? || @cells[i_to_i(input)] == " ")
  end

  def valid_move?(input)
    if i_to_i(input) >= 0 && i_to_i(input) <= 8 && !(taken?(input))
      return true
    else
      return false
    end
  end

  def update(input, player)
    @cells[i_to_i(input)] = player.token
  end

end