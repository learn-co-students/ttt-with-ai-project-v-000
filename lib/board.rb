require 'pry'
class Board
  attr_accessor :cells
  def initialize
  reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
   puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
   puts "-----------"
   puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
   puts "-----------"
   puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(cell_number)
  self.cells[cell_number.to_i-1]
   end

   def full?
     self.cells.all?{|token| token == "X" || token == "O"}
   end

   def turn_count
     self.cells.count{|token| token == "X" || token == "O"}
   end

   def taken?(cell_number)
     !(position(cell_number).nil? || position(cell_number) == " ")
   end

   def valid_move?(cell_number)
     cell_number.to_i.between?(1,9) && !taken?(cell_number)
   end
   def update(cell, player)
    self.cells[cell.to_i-1] = player.token

   end
end
