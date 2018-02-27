class Board

  attr_accessor :cells

   def reset!
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
     #@cells = Array.new(9, " ")
   end

   def initialize
     reset!
     #@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(input)
     @cells[input.to_i - 1]
   end

   def full?
     @cells.none? {|cell| cell == " "}
   end

   def turn_count
     turns = 0
     @cells.each do |turn|
       if turn == "X" || turn == "O"
         turns += 1
       end
     end
     turns
   end

   def taken?(index)
     !(position(index).nil? || position(index) == " ")
    # !(@cells[index.to_i - 1].nil? || @cells[index.to_i - 1] == " ")
   end

   def valid_move?(input)
     #input.to_i.between?(1,9) && !taken?(input)
     if position(input) == "X" || position(input) == "O" || input == "invalid"
       false
     else
       true
     end
   end

   def update(input, player)
     #position(input) = player.token
     @cells[input.to_i - 1] = player.token
   end
end
