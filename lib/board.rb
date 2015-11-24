
class Board
  attr_accessor :cells


  def initialize
    @cells = [" "] * 9
  end

  def reset!
    @cells.clear
    @cells = [" "] * 9
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
#    puts "Please select a position (1-9)\n"
#    pos = gets.rstrip
    @cells[pos.to_i - 1]
  end

  def full?
    @cells.all?{|x| x != " "}
  end

  def turn_count
    @cells.select{|x| x != " "}.length
  end

end