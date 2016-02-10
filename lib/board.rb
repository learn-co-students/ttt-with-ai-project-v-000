require 'pry'

class Board

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end  

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-" * 11
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-" * 11
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    position = self.cells[input.to_i-1]
    #binding.pry
  end

  def full?
   self.cells.none?{|x| x == " "} 
   #   !(cells.include?(" "))
  end

  def turn_count #(refactor)
    empty_cells = cells.select {|cell| cell == " "}
    turns_completed = (9 - empty_cells.length)
    #turn_count = 9 - (cells.count(" ")) #refactored
  end

  def taken?(input)
  self.cells[input.to_i-1] == "X" || self.cells[input.to_i-1] == "O"
    
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input,player)
    self.cells[input.to_i-1] = player.token
  end

end
