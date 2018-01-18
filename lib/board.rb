class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    position = user_input.to_i - 1
    return @cells[position]
  end

  def full?
    return !@cells.include?(" ")
  end

  def turn_count
    return 9 - @cells.count(" ")
  end

  def taken?(position)
    return true if position(position) == "X" || position(position) == "O"
    return false
  end

  def valid_move?(pos)
    !taken?(pos) && pos.to_i.between?(1,9)
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
  end

end
