class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} }"
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} }"
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} }"
  end

  def position(a)
    p = a.to_i - 1
    @cells[p]
  end

  def full?
    !@cells.any?{|element| element == nil || element == "" || element == " "}
  end

  def turn_count
  end
end
