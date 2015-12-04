require 'pry'

class Board

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells 
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

  def position(input)
    # binding.pry
      if input.to_i > 0 && input.to_i < 10
      cells[input.to_i-1]
    else
      false 
    end 
  end

  def full?
    if cells.include?(" ")
      false
    else 
      true
    end 
  end 

  def turn_count 
    cells.count do |string|
      string != " "
    end 
  end 

  def taken?(input)
    position(input).include?("O") || position(input).include?("X") 
  end 

  def valid_move?(input)
    if input.to_i > 0
      !taken?(input) 
    else
      false 
    end 
  end 

  def update(pos, player)
    # binding.pry
    cells[pos.to_i-1] = player.token
  end 

end 