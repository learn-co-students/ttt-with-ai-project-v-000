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
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    self.cells[input.to_i-1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.count{|cell| cell != " "}
  end

  def taken?(input)
   position(input) != " "
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !self.taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
