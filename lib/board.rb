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

  def position(inp)
    cells[inp.to_i - 1]
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count { |token| token != " "  }
  end

  def taken?(inp)
    position(inp) != " "
  end

  def valid_move?(inp)
    inp.to_i.between?(1,9) && !taken?(inp)
  end

  def update(pos, player)
    cells[pos.to_i-1] = player.token
  end

end
