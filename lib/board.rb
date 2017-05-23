require 'pry'

class Board
    attr_accessor :cells
    
    def initialize
        
        @cells = [" "," "," "," "," "," "," "," "," "]

    end
 
    def reset!
        cells.clear
        self.cells = [" "," "," "," "," "," "," "," "," "]
        
        
    end
    
    
    def display

     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end
    
    
    def position(input)

    "#{@cells[input.to_i-1]}"
    end



    def full?
      @cells.all? do |space|
        space == "X" || space == "O"
         end
    end

    def turn_count
     counter = 0
    @cells.each do |char|
     if char == "X" || char == "O"
      counter += 1
    end
    end
    counter
   end

   def taken?(index_number)
       if @cells[index_number.to_i-1] == " " || @cells[index_number.to_i-1] == "" || @cells[index_number.to_i-1] == nil
       false
     elsif @cells[index_number.to_i-1]== "X" || "O"
       true
     end
     end

     def valid_move?(index_number)
         if index_number.to_i.between?(0, 8) && taken?(index_number.to_i) == false
            binding.pry
        else
          true
       end
       end



        
        

end