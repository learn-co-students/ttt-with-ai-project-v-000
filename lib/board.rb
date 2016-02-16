require 'pry'

class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
    @cells
  end

  def display
    line = "-----------"
    puts "Current Board"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts line
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts line
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n"
  end

  def position(pos)
    pos = pos.to_i - 1
    @cells[pos]
  end

  def full?
  !@cells.include?(" ")
  end

  def turn_count
    @cells.count {|turn| turn != " "}
  end

  def taken?(pos)
    position(pos) != " "
  end

  def valid_move?(pos)
    # binding.pry
    pos.to_i.between?(1,9) && !taken?(pos) 
  end

  def update(pos, player)
    @cells[(pos.to_i)-1] = player.token if valid_move?(pos)
  end
end
