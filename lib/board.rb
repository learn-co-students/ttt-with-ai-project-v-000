class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    i = -1
    3.times do
      puts " #{@cells[i+=1]} | #{@cells[i+=1]} | #{@cells[i+=1]} "
      puts "-----------" if i < 6
    end
  end

  def position(pos)
    pos = pos.to_i - 1
    @cells[pos]
  end

  def full?
    !@cells.any? { |cell| cell == " " }
  end

  def turn_count
    @cells.keep_if { |cell| cell != " "}.count
  end

  def taken?(pos)
    pos = pos.to_i - 1
    @cells[pos] != " "
  end

  def valid_move?(pos)
    return false if !/[123456789]/.match(pos)
    pos = pos.to_i - 1
    @cells[pos] == " "
  end

  def update(pos, player)
    pos = pos.to_i - 1
    @cells[pos] = player.token
  end
end
