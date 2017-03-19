class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def to_index(input)
    input.to_i - 1
  end

  def position(input)
    self.cells[to_index(input)]
  end

  def full?
    self.cells.all?{|square| square != " " }
  end

  def turn_count
    self.cells.count{|square| square != " " }
  end

  def taken?(input)
    self.cells[to_index(input)] != " "
  end

  def valid_move?(input)
    !taken?(input) && to_index(input).between?(0,8)
  end

  def update(input, player)
    self.cells[to_index(input)] = player.token
  end

end
