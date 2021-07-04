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

  def position(user_input)
    input = user_input.to_i
    @cells[input - 1]
  end

  def full?
    @cells.none? {|cell| cell == " " || cell == nil} #added brackets
  end

  def turn_count
    count = 0 
    @cells.each do |cell| 
      count += 1 if cell == 'X' || cell == 'O'
    end 
    return count
  end 

  def taken?(x)
    if position(x) == 'X' || position(x) == 'O'
      return true 
    else
      return false
    end 
  end 

  def valid_move?(x)
    if x.to_i.between?(1, 9) && !taken?(x)
      return true
    else
      return false 
    end 
  end 

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end 

end
