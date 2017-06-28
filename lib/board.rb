require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    "#{cells[input.to_i.pred]}"
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    # binding.pry
    @cells.count {|token| token != " "}

  end

  def taken?(input)
    # binding.pry
    (@cells[input.to_i.pred] != " ") && (@cells[input.to_i.pred] != nil)
  end

  def valid_move?(input)
    # binding.pry
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    # binding.pry
    @cells[input.to_i.pred] = player.token
    @cells
  end

end
