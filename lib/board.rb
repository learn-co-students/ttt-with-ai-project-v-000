
require 'pry'
class Board
  attr_accessor :cells
  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
 end

 def position(p)
     cells[p.to_i - 1]
 end

 def full?
   if !cells.include?(" ")
     true
   else
    false
   end
 end

 def turn_count
   cells.select{|space| space != " "}.size
 end

 def taken?(input)
    if position(input) != " "
      true
    else
      false
    end
 end

 def valid_move?(input)
   input.to_i.between?(1,9) && !self.taken?(input)
 end

 def update(input, player)
    cells[input.to_i - 1] = player.token
 end
end
