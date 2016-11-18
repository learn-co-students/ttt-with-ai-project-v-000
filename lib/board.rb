require "pry"

class Board
attr_accessor :cells

  def initialize
    reset!
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

  def position(input)
    index = input.to_i-1
    return @cells[index]
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end

  def valid_move?(input)
    if !taken?(input) && input.to_i.between?(1, 9)
      true
    elsif taken?(input)
      false
    end
  end

  def turn_count
    count = 0
    @cells.each do |move|
      if (move == "X" || move == "O")
        count += 1
      end
    end

    return count
  end

  def taken?(input)
    if @cells[input.to_i-1] == " "
      false
    elsif @cells[input.to_i-1] = "X" || @cells[input.to_i-1] == "O"
      true
    end
  end

  def full?
    @cells.detect do |index|
      if(index == " ")
        return false
      end
    end
    return true
  end

end
