class Board

   attr_accessor :cells

   def initialize
     @cells = Array.new(9, " ")
   end

   def reset!
     @cells.clear
     initialize
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(input)
     index = input.to_i - 1
     @cells[index]
   end

   def full?
     @cells.all?{|token| token == "X" || token == "O"}
   end

   def turn_count
     turn = 0
     @cells.each do |token|
       if token == "X" || token == "O"
          turn += 1
       end
     end
     return turn
   end

   def taken?(input)
      cell = self.position(input)
      if cell == "X" || cell == "O"
        true
      else
        false
      end
   end

   #def valid_move?(input)
    # index.between?(0, 8) && !self.taken?(input)
   #end

   def valid_move?(input)
     input.to_i.between?(1,9) && !self.taken?(input)
   end

   def update(input, player)#player is 1,2, or C
     if valid_move?(input)
       @cells[input.to_i-1] = player.token
     end
   end

end
