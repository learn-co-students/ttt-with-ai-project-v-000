class Board
  attr_accessor :cells

  def initialize
    @cells = board_array
  end

  def reset!
    @cells = board_array
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  private
  def board_array
    [" "," "," "," "," "," "," "," "," "]
  end

end

