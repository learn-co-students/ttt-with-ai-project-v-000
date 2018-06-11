require 'pry'
# shortcut for input.to_i-1 ?
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts "           "
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "           "
  end

  def position(input)
    cells[(input.to_i)-1]
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count {|cell| cell != " "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    (0..8).include?((input.to_i) - 1) && !taken?(input)
  end

  def update(input, player)
    cells[(input.to_i) - 1] = player.token
  end




end
