
class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    @cells.all? do |index|
      index != " "
    end
  end

  def turn_count
    self.cells.count do |cell|
      cell == "X" || cell == "O"
    end
  end

  def taken?(cell)
    !(position(cell) == "" || position(cell) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
