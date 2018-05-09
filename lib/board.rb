require 'pry'

class Board
  attr_accessor :cells, :the_player

  def initialize
    self.reset!
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

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    cells.all? {|cell| cell != " "}
  end


  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(spot)
    self.position(spot) == " " ? false : true
    #line 21 for #position
  end

  def valid_move?(spot)
    spot.to_i.between?(1,9) && !taken?(spot)
  end

  def update(spot, player)
    self.cells[spot.to_i-1] = player.token
  end
end
