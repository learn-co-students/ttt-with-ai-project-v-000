class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-" * 11
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-" * 11
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def full?
    self.cells.none? { |c| c == " "}
  end

  def position(num)
    x = num.to_i - 1
    self.cells[x]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def taken?(move)
    self.position(move) != " "
  end

  def turn_count
    self.cells.count { |c| c == "O" || c == "X"} 
  end

  def update(move, player)
    self.cells[move.to_i - 1] = player.token unless self.taken?(move)
  end

  def valid_move?(move)
    move >= "1" && move <= "9" && !self.taken?(move)
  end

end
