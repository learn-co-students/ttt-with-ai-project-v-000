class Board
  attr_accessor :board, :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
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

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.count { |i|
      i == "O" || i == "X"
    }
  end

  def taken?(input)
    position(input) != " " ? true : false
  end

  def valid_move?(input)
    taken?(input) == false && input.to_i.between?(1, 9) ? true : false
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
