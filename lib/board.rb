class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i - 1]
  end

  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(pos)
    @cells[pos.to_i - 1] == "X" || @cells[pos.to_i - 1] == "O"
  end

  def valid_move?(pos)
    return false if (0..8).include?(pos.to_i - 1) == false
    @cells[pos.to_i - 1] == " "
  end

  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end

end
