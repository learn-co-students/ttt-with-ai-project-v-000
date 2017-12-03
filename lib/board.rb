class Board

  attr_accessor :cells

  def initialize
    @cells = reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def turn_count
    9 - cells.count(" ")
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

  def full?
    cells.count(" ") == 0
  end

  def taken?(input)
    position(input) != " "
  end

  def is_taken?(index)
    cells[index] != " "
  end

  def valid_move?(input)
    !taken?(input) && (input.to_i-1).between?(0,8)
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def the_hotness
    "This program is the hotness"
  end

end #class Board
