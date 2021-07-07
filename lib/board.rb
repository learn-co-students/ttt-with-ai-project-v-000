require 'pry'
class Board
  attr_accessor :cells, :token, :player

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.select {|x| x == " "}.count
  end

  def taken?(input)
    cells[input.to_i - 1] != " "
  end

  def valid_move?(input)
    (1..9) === input.to_i && !taken?(input)
  end

  def update(input, player)
    valid_move?(input)
    cells[input.to_i-1] = player.token
  end

end
