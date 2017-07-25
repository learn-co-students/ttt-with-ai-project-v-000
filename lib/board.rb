class Board
  attr_accessor :cells

  def initialize()
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n"
    puts "-----------\n"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} \n"
    puts "-----------\n"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} \n"
  end

  def position(input)
   input = input.to_i
   input = input - 1
   cells[input]
  end

  def full?
    cells.detect{|i| i == " "} == nil
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    cells[index.to_i-1] == "X" || cells[index.to_i-1] == "O"
  end

  def valid_move?(index)
    (index.to_i - 1).between?(0,8) && !taken?(index)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end
