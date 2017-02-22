class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " "
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts " "
  end

  def position(input)
    input_cell = input.to_i - 1
    @cells[input_cell]
  end

  def full?
    @cells.any? {|cell| cell == " "} ? false : true
  end

  def turn_count
    @cells.count{ |cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    input = input.to_i
    input <= 9 && input >= 1 && !taken?(input)
  end

  def update(input, player)
    input = input.to_i
    if valid_move?(input)
      @cells[input - 1] = player.token
    end
  end
end
