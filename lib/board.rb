require "pry"

class Board
  attr_accessor :cells

  def initialize
    @cells = reset!
  end

  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(n)
    cells[n.to_i - 1]
  end

  def full?
    !cells.include?(' ')
  end

  def turn_count
    cells.count{|c| c == "X" || c == "O"}
  end

  def taken?(n)
    index = n.to_i - 1
    !(cells[index].nil? || cells[index] == " ")
  end

  def valid_move?(n)
    !taken?(n.to_i) && n.to_i.between?(1,9)
  end

  def update(n, player)
    index = n.to_i - 1
    cells[index] = player.token
  end
end
