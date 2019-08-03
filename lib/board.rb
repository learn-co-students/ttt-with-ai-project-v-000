class Board
   attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def reset!
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def input_to_index(input)
     "#{input}".to_i - 1
   end

   def position(move)
     @cells[move.to_i - 1]
   end

   def full?
     if @cells.any? { |c| c == " "}
       false
     else
       true
     end
   end

   def turn_count
     @cells.select { |c| c != " "}.length
   end

   def taken?(move)
     if @cells[move.to_i - 1] == "X" || @cells[move.to_i - 1] == "O"
       true
     else
       false
     end
   end

   def valid_move?(move)
     if taken?(move) == false && move.to_i <= 9 && move.to_i >= 1
       true
     else
       false
     end
   end

   def update(move, player)
     @cells[move.to_i - 1] = player.token
   end
 end
