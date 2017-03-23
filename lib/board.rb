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

  def position(number)
    @cells[number.to_i-1]
  end

  def full?
    @cells.all? {|space| space != " "}
  end

  def turn_count
    9 - @cells.count {|cell| cell == " "}
  end

  def taken?(cell)
    @cells[cell.to_i-1] != " "
  end

  def valid_move?(input)
    taken?(input) == false && (1..9).include?(input.to_i) == true ? true : false
  end

  def update(cell, player)
    @cells[cell.to_i-1] = player.token
  end

end
