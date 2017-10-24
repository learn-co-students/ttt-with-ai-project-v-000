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
    i = input.to_i - 1
    cells[i]
  end

  def update(input, player)
    i = input.to_i - 1
    cells[i] = player.token
  end

  def full?
    cells.all?{|c| c=="O" || c=="X"}
  end

  def turn_count
    cells.count{|c| c!=" "}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    valid_num = input.to_i >=1 && input.to_i <= 9
    valid_num && !taken?(input)
  end

end
