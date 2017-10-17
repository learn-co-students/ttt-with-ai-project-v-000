require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ","-----------"," #{cells[3]} | #{cells[4]} | #{cells[5]} ","-----------"," #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(p)
    p = p.to_i - 1
    @cells[p]
  end

  def full?
    if @cells.any? {| x | x == " " || x == ""}
      false
    else
      true
    end
  end

  def turn_count
    turns = @cells.select {|p| p == "X" || p == "O"}
    turns.size
  end

  def taken?(p)
      if @cells[p.to_i-1] == "X" || @cells[p.to_i-1] == "O"
        true
      else
        false
      end
  end

  def valid_move?(p)
    if position(p) == "X" || position(p) == "O"
      false
    elsif p == "invalid"
      false
    else
      true
    end
  end

  def update(p, pl)
    @cells[p.to_i-1] = pl.token
  end
end
