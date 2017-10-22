class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ",  " ",  " ",  " ",  " ",  " ",  " "]
  end

  def reset!
    cells.clear
    @cells = [" ", " ", " ",  " ",  " ",  " ",  " ",  " ",  " "]
  end

  def display
    puts "------------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    return @cells[input.to_i-1]
  end

  def full?
    if @cells.include?(" ")
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    return counter
  end

  def taken?(position)
    if @cells[position.to_i - 1] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    if position.to_i < 10 && position.to_i > 0 && taken?(position) == false
      return true
    else
      return false
    end
  end

  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
    @cells[cell.to_i - 1]
  end


end
