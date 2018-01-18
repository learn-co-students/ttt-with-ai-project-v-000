require 'pry'

class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.none? {|i| i == " "} ? true : false
  end

  def turn_count
    @cells.count{|cell| cell != " "}
  end

  def taken?(location)
    @cells[location.to_i - 1] != " " && @cells[location.to_i - 1] != ""
  end

  def valid_move?(input)
    (input.to_i - 1).between?(0,8) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
