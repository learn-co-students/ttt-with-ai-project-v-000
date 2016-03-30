class Board

  attr_accessor :cells

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    #puts " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]}  \n"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    cells[num.to_i - 1]
  end

  def full?
    turn_count == 9
  end

  def turn_count
    cells.count("X") + cells.count("O")
  end

  def valid_move?(num)
     taken?(num) == false && num.to_i.between?(1, 9)
  end

  def taken?(num)
    cells[(num.to_i - 1)] == " " ? false : true
  end

  def update(num, player)
      cells[(num.to_i-1)] = player.token

  end

  def reset!
    self.cells.clear
    self.cells=(Array.new(9, " "))
  end
end
