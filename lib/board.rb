class Board
  attr_accessor :cells

  def initialize
    self.reset!
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

  def position(pos)
    self.cells[(pos.to_i) - 1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.select {|cell| cell == "X" || cell == "O"}.size
  end

  def taken?(pos)
    position(pos) != " " && position(pos) != nil ? true : false
  end

  def valid_move?(pos)
    if (1..9).include?(pos.to_i) && taken?(pos) == false
      return true
    else
      false
    end 
  end

  def update(pos, player)
    self.cells[pos.to_i - 1] = player.token
  end

end
