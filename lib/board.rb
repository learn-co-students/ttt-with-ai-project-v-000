require 'pry'

class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts '-----------'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts '-----------'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    cells[position.to_i - 1]
  end

  def full?
    true if cells.include?(' ') == false
  end

  def turn_count
    cells.count { |x| x if x != ' ' }
  end

  def taken?(num)
    cells[num.to_i - 1] != ' ' ? true : false
  end

  def valid_move?(num)
    taken?(num.to_i) == false && num.to_i.between?(1, 9) ? true : false
  end

  def update(num, player)
    cells[num.to_i - 1] = player.token
  end
end
