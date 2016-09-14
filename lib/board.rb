class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def input_to_position(input)
    input.to_i-1
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input_to_position(input)]
  end

  def full?
    !cells.detect {|cell| cell == " "}
  end

  def turn_count
    cells.select {|cell| cell != " "}.size
  end

  def taken?(input)
    cells[input_to_position(input)] == "X" || cells[input_to_position(input)] == "O" || false
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
   end

   def update(input, player)
     cells[input_to_position(input)] = player.token
   end
end
