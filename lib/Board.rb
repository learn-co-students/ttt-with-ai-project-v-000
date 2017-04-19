require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells =  Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def index(som)
    som.to_i - 1
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(pos)
    cells[index(pos)]
  end

  def full?
    cells.detect{|cell| cell == " "}? false : true
  end

  def turn_count
    count = 0
    cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(num)
    position(num) != " " ? true : false
  end

  def valid_move?(num)
    num.between?("1","9") && !taken?(num)
  end

  def update(num,player)
    cells[index(num)] = player.token
  end

end
