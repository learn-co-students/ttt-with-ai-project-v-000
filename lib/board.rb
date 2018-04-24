class Board
  attr_accessor :cells


  def initialize
    self.reset!
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

  def position(cell)
    @cells[cell.to_i - 1]
  end

  def full?
    @cells.all? {|x| x == "X" || x == "O"}
  end

  def turn_count
    @cells.count {|x| x == "X" || x == "O"}
  end

  def taken? (cell)
    self.position(cell) == "X" || self.position(cell) == "O"
  end

  def valid_move? (cell)
    !taken?(cell) if cell.to_i.between?(1,9)
  end

  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end
end
