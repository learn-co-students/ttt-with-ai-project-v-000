require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(input)
     @cells[input.to_i-1]
   end

   def full?
     @cells.all? { |c| c == "X" || c == "O" }
   end

   def turn_count
     cells.count{|token| token == "X" || token == "O"}
   end

   def taken?(input)
     position(input) != " "
   end

   def valid_move?(input)
     if input.to_i.is_a?(Integer) && input.to_i.between?(1, 9)
       taken?(input.to_i) == false
     end
   end

   def update(input, ptoken)
      cells[input.to_i-1] = ptoken.token
   end

end
