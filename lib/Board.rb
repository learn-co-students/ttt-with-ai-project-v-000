require 'pry'
class Board
  attr_accessor :cells
  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def index(input_str)
    input_str.to_i - 1
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts " "
  end

  def position(pos)
    cells[index(pos)]
  end

  def full?
    cells.all? {|cell| cell != " "}
    #cells.detect{|cell| cell == " "}? false : true
  end

  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
    # count = 0
    # cells.each {|cell| count += 1 if cell != " "}
    # count
  end

  def taken?(input_str)
    position(input_str) != " " ? true : false
  end

  def valid_move?(input_str)
    input_str.between?("1","9") && !taken?(input_str)
  end

  def update(input_str,player)
    cells[index(input_str)] = player.token
  end

end
