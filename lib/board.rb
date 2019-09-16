require 'pry'

class Board
  attr_accessor :cells, :position

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def position(input)
    self.cells[input.to_i-1]
  end

  def full?
    self.cells.all? { |b| b == "X" || b == "O" }
  end

  def turn_count
    self.cells.count{ |b| b == "X" || b == "O" }
  end

  def taken?(input)
    position(input) != " " && position(input) != "invalid"
    # position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i-1] = player.token
  end

end
