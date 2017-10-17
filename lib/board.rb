require 'pry'
require_relative './text.rb'

class Board
  include Text
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def display_with_indices
    puts "\n"
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts "\n"
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

  def full?
    cells.none? { |el| el.nil? || el == " " }
  end

  def turn_count
    i = 0
    cells.each { |el| i += 1 if el == "X" || el == "O" }
    i
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    taken_alert if taken?(input)
    invalid_alert unless input.to_i.between?(1, 9)
    input.to_i.between?(1, 9) && !taken?(input)
  end
end
