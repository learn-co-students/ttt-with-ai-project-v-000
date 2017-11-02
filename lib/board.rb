class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} ".colorize(:yellow)
    puts "-----------".colorize(:yellow)
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} ".colorize(:yellow)
    puts "-----------".colorize(:yellow)
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} ".colorize(:yellow)
  end

  def display_reference
    puts "       1 | 2 | 3 ".colorize(:yellow)
    puts "      -----------".colorize(:yellow)
    puts "       4 | 5 | 6 ".colorize(:yellow)
    puts "      -----------".colorize(:yellow)
    puts "       7 | 8 | 9 \n".colorize(:yellow)
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.all? { | i | i != " " }
  end

  def turn_count
    self.cells.count {| occupied | occupied != " " }
  end

  def taken?(input)
    self.position(input) != " "
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end
end
