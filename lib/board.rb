class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "\n #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(cell)
    @cells[cell.to_i - 1]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(cell)
    position(cell) != " " && position(cell) != ""
  end

  def valid_move?(cell)
    cell.to_i.between?(1,9) && !taken?(cell)
  end

  def update(cell, player)
    valid_move?(cell) ? cells[cell.to_i - 1] = player.token : nil
  end

end
