

class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position_number)
    position_number = position_number.to_i - 1
    @cells[position_number]
  end

  def full?
    if !@cells.include?(" ")
      true
    else
      false
    end
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

  def taken?(position_number)
    position_number = position_number.to_i - 1
    if @cells[position_number] == "X" || @cells[position_number] == "O"
      true
    elsif @cells[position_number] == " " || @cells[position_number] == ""
      false
    end
  end

  def valid_move?(position_number)
    if position_number.to_i.between?(1, 9) && !self.taken?(position_number)
      true
    else
      false
    end
  end

  def update(position_number, player)
    position_number = (position_number.to_i) -1
    self.cells[position_number] = player.token
  end


end
