class Board
  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    self.cells = cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    line = "-----------"
    puts row(0, 1, 2)
    puts line
    puts row(3, 4, 5)
    puts line
    puts row(6, 7, 8)
  end

  def row(index_1, index_2, index_3)
    " #{cells[index_1]} | #{cells[index_2]} | #{cells[index_3]} "
  end

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.all?{|token| token != " "}
  end

  def turn_count
    cells.count{|token| token != " "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !taken?(input) && (input.to_i - 1).between?(0, 8)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
end
