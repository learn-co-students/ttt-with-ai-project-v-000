require 'pry'
class Board

  attr_accessor :cells


  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    #binding.pry
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(int)
    int = int.to_i
    cells[int-1]
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    count = 0
    cells.map { |cell|  count += 1 if cell != " "  }
    count
  end

  def taken?(str)
    int = str.to_i-1
    cells[int] != " " ? true : false
  end

  def valid_move?(str)
    #int = Integer(str) rescue false
    int = str.to_i
    int.between?(1,9) ? !taken?(int) : false
    #binding.pry
  end

  def update(pos, player)
    #binding.pry
    cells[pos.to_i-1] = player.token
  end

end
