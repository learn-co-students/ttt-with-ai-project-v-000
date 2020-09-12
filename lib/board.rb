require 'pry'

class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @input = input.to_i - 1
    @cells[@input]
  end

  def full?
    if @cells.include? " "
      false
    else
      true
    end
  end

  def turn_count
    @cells.count {|position| position != " "}
  end

  def taken?(position)
    @position = position.to_i - 1
    if ((@position >=0 && @position <= 8) && @cells[@position] != " ")
      true
    else
      false
    end
  end

  def valid_move?(position)
    @position_taken = taken?(position)
    @position = position.to_i - 1
    if ((@position >=0 && @position <= 8) && !@position_taken)
      true
    else
      false
    end
  end

  def update(position,player)
    @position = position.to_i - 1
    @cells[@position] = player.token
  end

  def reset!
    @cells = []
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

end
