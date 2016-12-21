class Board
  
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(value)
    cells[value.to_i - 1]
  end

  def full?
    cells.all? { |board| board === "X" || board === "O" }
  end

  def turn_count
    count = 0
    @cells.each do |p|
      if p == "X" || p == "O"
        count += 1
      end
    end
    count
  end

  def taken?(p)
    position(p) == "X" || position(p) == "O" ? true : false
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && !taken?(move) ? true : false
  end

  def update(spot, player)
    cells[spot.to_i-1] = player.token
  end

end



