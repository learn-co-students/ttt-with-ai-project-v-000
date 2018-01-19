class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, ' ')
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    print " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    print "-----------"
    print " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    print "-----------"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !(@cells.include?(nil) || cells.include?(' '))
  end

  def turn_count
    @cells.delete_if { |token| token == ' ' }.count
  end

  def taken?(input)
    @cells[input.to_i - 1] == 'X' || @cells[input.to_i - 1] == 'O'
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
