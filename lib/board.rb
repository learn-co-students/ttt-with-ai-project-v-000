require 'pry'
class Board

  attr_accessor :cells, :token

  def initialize
    @cells = Array.new(9, " ")
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

def position(n)
  @cells[n.to_i - 1]
end

def full?
  @cells.detect{|cell| cell == " "} ? false : true
  end

def turn_count
  @cells.count{|cell| cell != " "}
end

def taken?(i)
  @cells[i.to_i-1] == " " ? false : true
end

def valid_move?(i)
  !taken?(i) && i.to_i < 10 && i.to_i > 0
end

def update(i, player)
  @cells[i.to_i - 1] = player.token
end


end
