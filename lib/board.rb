require 'pry'
class Board
   attr_accessor :cells
   def initialize
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def reset!
      @cells.clear
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(pos)
      @cells[pos.to_i-1]
   end

   def full?
      @cells.all?{|c| c == "X" || c == "O" }
   end

   def turn_count
      @cells.count{|c| c != " "} 
   end

   def taken?(pos)
      @cells[pos.to_i-1] != " "
   end

   def valid_move?(pos)
      !taken?(pos) && pos.to_i.between?(1,9)
   end

   def update(posi, p)
      @cells[posi.to_i - 1] = p.token
   end
end