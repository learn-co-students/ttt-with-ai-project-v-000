require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    initialize
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    binding.pry
    cells[input.to_i-1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    !(position(input) == " " || position(input).nil?)
  end

  def valid_move?(input)
    !taken?(input) && (input.to_i - 1).between?(0,8)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end
