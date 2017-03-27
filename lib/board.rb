class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")

  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "

  end
#  def reset!
#    @cells = Array.new(9, " ")
#  end
  def position(pos)
    #returns "X", " " or "O"
    @cells[pos.to_i-1]

  end
  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end
#  def token

#  end
  def full?
    !@cells.include? (" ")
  end
  def turn_count
    @cells.collect.count {|x| x == "X" || x == "O"}
  end
  def taken?(pos)
    position(pos) == "X" || position(pos) == "O" ? true : false
  end
  def valid_move?(pos)
     !taken?(pos) && pos.to_i.between?(1,9)
  end

end
