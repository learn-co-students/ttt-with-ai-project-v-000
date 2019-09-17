class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    self.cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display
    a, b, c, d, e, f, g, h, i = cells
    puts " #{a} | #{b} | #{c} "
    puts '-----------'
    puts " #{d} | #{e} | #{f} "
    puts '-----------'
    puts " #{g} | #{h} | #{i} "
    puts
  end

  def position(input)
    cells[input.strip.to_i - 1]
  end

  def update(space, player)
    i = space.strip.to_i - 1
    cells[i] = player.token
  end

  def full?
    cells.all? { |cell| %w[X O].include?(cell) }
  end

  def turn_count
    turn = 0
    cells.each { |cell| turn += 1 if %w[X O].include?(cell) }
    turn
  end

  def taken?(input)
    %w[X O].include?(position(input))
  end

  def valid_move?(input)
    %w[1 2 3 4 5 6 7 8 9].include?(input) && !taken?(input)
  end
end
