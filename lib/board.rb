require 'pry'

class Board 
  attr_accessor :cells
  
  def initialize 
    self.cells = Array.new(9, " ")
  end 

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end 

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts  "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end 
  
  def position(input)
    selection = input.to_i-1
    cells[selection]
  end 
  
  def full?
    if cells.any?{ |cell| cell == " " }
      false 
    else 
      true
    end 
  end 
  
  def turn_count 
    turns = cells.find_all{ |cell| cell != " " }
    turns.count
  end 
  
  def taken?(input)
    selection = input.to_i-1
    if cells[selection] != " "
      true
    else 
      false
    end
  end 
  
  def valid_move?(input)
    selection = input.to_i-1
    selection.between?(0, 8) && !taken?(input) 
  end
  
  def update(input, player)
    selection = input.to_i-1 
    if valid_move?(input)
      cells[selection] = player.token
    end
  end 
  
end 