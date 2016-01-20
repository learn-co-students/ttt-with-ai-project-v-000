class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
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

  def position(location)
    cells[location.to_i-1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.size - cells.count(" ")
  end

  def taken?(location)
    position(location) != " "
  end

  def valid_move?(location)
    if location.to_i > 0 && location.to_i < 10
      !taken?(location)
    else
      false
    end
  end

  def update(location, player)
    if valid_move?(location)
      cells[location.to_i-1] = player.token
    end
  end

end