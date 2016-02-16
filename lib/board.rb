require 'pry'
class Board
  attr_accessor:cells

   def initialize
    reset!
   end

   def reset!
    @cells = Array.new(9," ")
   end

   def display
    puts
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} " 
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} " 
    puts
   end

   def position(input)
    self.cells[input.to_i - 1]
   end

   def update(pos,player)
      self.cells[pos.to_i-1] = player.token

   end

   def full?
    self.cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    self.cells.count{|t| t=="X" || t=="O"}
  end

   def taken?(pos)
    !(position(pos).nil? || position(pos) == " ")
   end

   def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken?(pos)
   end


end