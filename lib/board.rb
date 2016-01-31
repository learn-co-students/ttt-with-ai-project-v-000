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

  def position(pos)
    return @cells[pos.to_i-1]
  end

  def full?
    result = @cells.detect{|pos| pos == " "}
    result == " " ? false : true
  end

  def turn_count
    result = @cells.select{|pos| pos == "X" || pos == "O"}
    return result.count
  end

  def taken?(pos)
    if @cells[pos.to_i-1] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(pos)
    pos = pos.to_i
    if pos >= 1 && pos <= 9 && !taken?(pos)
      return true
    else
      return false
    end
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end

end