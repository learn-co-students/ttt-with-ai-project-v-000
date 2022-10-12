class Board
  attr_accessor :cells

  def initialize
    @cells = reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts ""
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
    # !cells.include?(" ")
    # Line 28 is more efficient
    cells.all? { |cell| cell != " " }
  end

  def turn_count
    # 9 - cells.count(" ")
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end