require 'pry'
class  Board
   attr_accessor :cells

        def reset!
          @cells = Array.new(9, " ")

        end

       def initialize
         reset!
       end

       def display
         puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
         puts "-----------"
         puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
         puts "-----------"
         puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
      end


      def position(input)
         self.cells[input.to_i - 1]
      end


      def full?
        cells.all? do |element|  #element could be anything
          element == "X" || element == "O"
        end

      end

     def turn_count
        turn_count = 0
        cells.each do |cell|
        "number of turns played is #{cells}"
        if cell =="O" || cell == "X"
          turn_count += 1
        end
        end
        turn_count
      end


      def taken?(input)
         if position(input) == "X" || position(input) == "O"
            true
         else
            false
         end
      end


      def valid_move?(input)
         #using the line #50 taken and use the .to_i to change the string into an interger.
         if  taken?(input) || !input.to_i.between?(1,9)
            false
         else
            true
         end
      end

      def update (index,player)
         @cells[index.to_i - 1] = player.token
      end
end
