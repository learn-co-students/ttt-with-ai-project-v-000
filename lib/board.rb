class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def turn_count
    count = 9 - @cells.count(" ")
  end

  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end

  def full?
    !@cells.include?(" ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    index = input_to_index(input)
    @cells[index] = player.token
  end
end
