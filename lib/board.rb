class Board

  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}  "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}  "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}  "
  end

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.all? { |token| token == "X" || token == "O" }
  end

  def turn_count
    cells.select { |cell| cell == "X" || cell == "O" }.count
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    index = input.to_i - 1
    if (index.between?(0,8) && taken?(input) == false)
      true
    else
      false
    end
  end

  def update(input, player)
    if valid_move?(input)
      position(input).replace(player.token)
    end
  end
end
