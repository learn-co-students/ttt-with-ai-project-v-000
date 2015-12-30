class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  #def [](index)
  #  self.cells[index]
  #end

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

  def position(spot)
    cells[spot.to_i - 1]
  end

  def full?
    !(cells.include?(" "))
  end

  def turn_count
    cells.count{|c| c != " "}
  end

  def taken?(spot)
    cells[spot.to_i - 1] != " "
  end

  def valid_move?(spot)
    spot.to_i.between?(1,9) && !taken?(spot)
  end

  def update(spot, player)
    cells[spot.to_i - 1] = player.token
  end


end