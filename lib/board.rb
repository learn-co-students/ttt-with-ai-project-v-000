class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9," ")
 end

  def display
    i = -1

    puts ""
    3.times do
      puts " #{@cells[i+=1]} | #{@cells[i+=1]} | #{@cells[i+=1]} "
      puts "-----------" if i < 6
    end
    puts ""
  end

  def position(pos)
    pos = pos.to_i - 1
    @cells[pos]
  end

  def full?
    !@cells.any? { |cell| cell == " " }
  end

  def turn_count
    @cells.count { |cell| cell != " "}
  end

  def taken?(pos)
    pos = pos.to_i - 1
    @cells[pos] != " "
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken(pos)
  end

  def update(pos, player)
    pos = pos.to_i - 1
    @cells[pos] = player.token
  end
end
