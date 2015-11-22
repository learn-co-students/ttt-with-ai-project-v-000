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

  def position(spot)
    cells[spot.to_i - 1]
  end

  def full?
    !(cells.include?(" "))
  end

  def turn_count
    turns = cells.delete_if{|a| a == " "}
    turns.count
  end

  def taken?(spot)
    index = spot.to_i - 1
    cells[index] != " "
  end

  def valid_move?(spot)
    ok = ["1","2","3","4","5","6","7","8","9"]
    if ok.include?(spot) && (taken?(spot) == false)
      return true
    else
      false
    end
  end

  def update(spot, player)
    cells[spot.to_i - 1] = player.token
  end


end