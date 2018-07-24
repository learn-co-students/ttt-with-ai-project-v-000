# Contains methods to play a game if tic-tac-toe
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, ' ')
  end

  def reset!
    @cells.clear && @cells = Array.new(9, ' ')
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    !(@cells.any? { |token| token == ' ' })
  end

  def turn_count
    turn_count = 0
    @cells.each do |value|
      turn_count += 1 if value.include?('X') || value.include?('O')
    end

    turn_count
  end

  def taken?(input)
    !(position(input) == '' || position(input) == ' ')
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1, 9)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
end
