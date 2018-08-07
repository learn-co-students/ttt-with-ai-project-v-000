class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end
  def reset!
    @cells = Array.new(9, " ")
  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def position(user_input)
    cells[user_input.to_i - 1]
  end
  def full?
    cells.all?{|a| a == "X" || a == "O"}
  end
  def turn_count
    cells.count{|a| a == "X" || a == "O"}
  end
  def taken?(inpt)
    position(inpt) == "X" || position(inpt) == "O"
  end
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  def update(input,player)
    cells[input.to_i - 1] = player.token
  end
end
