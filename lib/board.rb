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
    cells[input.to_i-1]
  end

  def full?
    if !cells.include?(" ")
      return true
    else
      return false
    end
  end

  def turn_count
    cells.count do |token|
      token == "X" || token == "O"
    end
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def taken?(input)
    if position(input) == " "
      return false
    else
      return true
    end
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
