class Board
  attr_accessor :cells
  def initialize
    reset!
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
    index = input.to_i - 1
    @cells[index]
  end

  def update(spot, player)
    #set position = player.token attribute
    @cells[spot.to_i - 1] = player.token
  end

  def taken?(spot)
    ["X", "O"].include?(position(spot))
  end

  def valid_move?(spot)
    spot.to_i.between?(1, 9) && !taken?(spot.to_i)
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end


end
