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
    index = input_to_index(input)
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
    if (input_to_index(input).between?(0,8) && taken?(input) == false)
      true
    else
      false
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def update(input, player)
    index = input_to_index(input)
    cells[index] = player.token
  end
end
