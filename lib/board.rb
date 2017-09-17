require 'pry'

class Board
  attr_accessor :cells, :turn_count

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ') # resets board to original state
    @turn_count = 0
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
    @cells.select { |c| c != ' ' }.count == 9 ? true : false
  end

  def turn_count
    @turn_count = @cells.select { |c| c != ' ' }.count
  end

  def taken?(position)
    @cells[position.to_i - 1] != ' '
  end

  def valid_move?(position)
    (1..9).include?(position.to_i) && !taken?(position)
  end

  def update(position, player)
    if valid_move?(position)
      @cells[position.to_i - 1] = player.token
    end
  end
end