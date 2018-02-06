class Board
  include
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.none? {|x|  x == " " || x == "" || x == nil}
  end

  def turn_count
    @cells.count {|x|  x == "X" || x == "O"}
  end

  def taken?(input)
    @cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O"
  end

  def update(spot, player)
    index = spot.to_i - 1
    @cells[index] = player.token
  end

  def valid_move?(spot)
    (taken?(spot.to_i) == false) && (spot.to_i.between?(1,9))
    #binding.pry
  end




end
