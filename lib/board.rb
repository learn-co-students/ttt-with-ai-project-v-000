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
    index = input.to_i - 1
    cells[index]
  end

  def update(input,player)
    cells[input.to_i-1] = player.token
  end


  def taken?(input)
    token = position(input)
    if token == "X" || token == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if taken?(input) || input.to_i < 1 || input.to_i > 9
      false
    else
      true
    end
  end

  def turn_count
    cells.count{|x| x == "X" || x == "O"}
  end

  def full?
    cells.all?{|x| x == "X" || x == "O" }
  end

end
