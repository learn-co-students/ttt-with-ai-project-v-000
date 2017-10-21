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

  def position(cell)
    @cells[cell.to_i - 1]
  end

  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end

  def taken?(cell)
    position(cell) == "X" || position(cell) == "O"
  end

  def valid_move?(cell)
    cell.to_i.between?(1,9) && !(taken?(cell))
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end

  def reset!
    @cells = Array.new(9, " ")
  end

end
