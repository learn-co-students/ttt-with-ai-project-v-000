class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    num = input.to_i
    num = num -1
    cells[num]
  end

  def full?
    @cells.include?(" " || "") ? false : true 
  end #full?

  def turn_count
    turns = 0
    @cells.each{|cell| cell == "O" || cell == "X" ? turns += 1 : turns += 0}
    turns
  end


end # class Board