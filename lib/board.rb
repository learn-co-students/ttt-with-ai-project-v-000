class Board

  attr_accessor :cells

  def reset!
    cells.clear
    9.times { cells << " " }
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts "\n #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def to_index(input)
    input.to_i - 1
  end

  def position(input)
    cells[to_index(input)]
  end

  def full?
    !cells.any? { |cell| cell == " " }
  end

  def turn_count
    cells.select { |cell| cell != " " }.size
  end

  def taken?(input)
    cells[to_index(input)] != " "
  end

  def valid_move?(input)
    !taken?(input) && to_index(input) >= 0 && to_index(input) < 9
  end

  def update(input, player)
    cells[to_index(input)] = player.token if valid_move?(input)
  end
end