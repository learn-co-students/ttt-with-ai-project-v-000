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

  def position(x)
    cells[x.to_i-1]
  end

  def full?
    cells.all? do |space|
      space == "X" || space == "O"
    end
  end

  def turn_count
      cells.count{|space| space == "O" || space == "X"}
  end

  def taken?(location)
    p = location.to_i-1
    if cells[p] != " " && cells[p] != ""
      true
    else
      false
    end
  end

  def valid_move?(location)
    !taken?(location) && location.to_i.between?(1,9)
  end

  def update(location, player)
    cells[location.to_i-1] = player.token
  end

end
