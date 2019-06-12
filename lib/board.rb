require 'pry'

class Board
  attr_accessor :cells, :player

  def initialize
    @player = player
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.none? { |i| i == ' ' }
  end

  def turn_count
    counter = 0
    @cells.each do |turn|
      counter += 1 if turn == 'X' || turn == 'O'
    end
    counter
  end

  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == '' || @cells[index] == ' ' || @cells[index].nil?
      false
    else
      true
    end
  end

  def valid_move?(input)
    input = input.to_i
    true if taken?(input) == false && input.between?(1, 9)
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end
end
