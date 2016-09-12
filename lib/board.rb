class Board
  attr_accessor :cells

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def display_positions
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end

  def position(input_string)
    cells[input_string.to_i-1]
  end

  def update(input_string, player)
    cells[input_string.to_i-1] = player.token
  end

  def full?
    cells.none?{|cell| cell == " "}
  end

  def turn_count
    cells.count {|cell| cell != " "}
  end

  def taken?(input_string)
    position(input_string) != " "
  end

  def valid_move?(input_string)
    !taken?(input_string) && (input_string.to_i).between?(1,9)
  end

end
