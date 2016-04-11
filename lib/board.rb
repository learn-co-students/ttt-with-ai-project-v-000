class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    cells[position.to_i - 1]
  end

  def full?
    cells.include?(" ") ? false : true
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(position)
    position(position) != " "
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(position, character)
    cells[position.to_i - 1] = character.token
  end
end
