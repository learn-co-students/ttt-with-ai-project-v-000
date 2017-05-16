class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i
    input -= 1
    @cells[input]
  end

  def full?
    !(@cells.any? {|cell| cell == " "})
  end

  def turn_count
    @cells.select {|cell| cell =="X" || cell == "O"}.count
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else false
    end
  end

  def valid_move?(input)
    input = input.to_i
    if input.between?(1, 9)
      !(taken?(input))
    end
  end

  def update(input, player = "X")
    input = input.to_i
    input = input-=1
    @cells[input] = player.token
    end
end
