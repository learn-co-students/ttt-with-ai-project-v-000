class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(move)
    #takes in a string 1-9 and converts to cell index
    @cells[move.to_i - 1]
  end

  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
  end

  def full?
    @cells.none? {|x| x == " " || x == "" || x == nil}
  end

  def turn_count
    @cells.count {|x| x == "X" || x == "O"}
  end

  def taken?(move)
    @cells[move.to_i-1] == "X" || @cells[move.to_i-1] == "O"
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && !taken?(move)
  end

end
