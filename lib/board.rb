require 'pry'
class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells.clear.fill(" ", 0..8)
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    position = position.to_i - 1
    cells[position]
  end

  def full?
    unless self.cells.any? {|token| token.include?(" ")}
      self.cells.all? == "X" || "O"
    end
  end

  def turn_count
    self.cells.count {|token| token == "O" || token == "X"}
  end

  def taken?(position)
   position = position.to_i - 1
    self.cells[position] == "X" || self.cells[position] == "O" ? true : false
  end

  def valid_move?(position)
    position = position.to_i - 1
      position.between?(0,8) && !(self.cells[position] == "X" || self.cells[position] == "O") ? true : false
  end

  def update(position, current_player)
    position = position.to_i - 1
      self.cells[position] = current_player.token
  end

end


