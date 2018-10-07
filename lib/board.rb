class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    # input = index(input)
    cells[index(input)]
  end

  def full?
    !cells.include? " "
  end

  def index(input)
    input = input.to_i - 1
  end

  def turn_count
    9 - cells.count{|c| c == " "}
  end

  def taken?(input)
    input = index(input)
    cells[input].include?("X") || cells[input].include?("O")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    input = index(input)
    cells[input] = player.token
  end

end
