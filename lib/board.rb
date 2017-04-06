require 'pry'

class Board
  attr_accessor :cells, :choice

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    self.cells.all? { |t| t == "X" || t == "O" }
  end

  def turn_count
    self.cells.count {|c| c != " "}
  end

  def taken?(input)
    self.position(input) != " " ? true : false
  end

  def valid_move?(input)
    true if (1..9) === input.to_i && !(self.taken?(input))
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token
  end
end
