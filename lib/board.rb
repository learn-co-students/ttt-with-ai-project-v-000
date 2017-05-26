require 'pry'

class Board
    attr_accessor :cells, :token
    
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

#    def display_preturn
#      puts " 1 | 2 | 3 "
#      puts "-----------"
#      puts " 4 | 5 | 6 "
#      puts "-----------"
#      puts " 7 | 8 | 9 "
    
#     end
    
    def position(input)

    "#{@cells[input.to_i-1]}"
    end



    def full?
      @cells.all? do |space|
        space == "X" || space == "O"
         end
    end

    def turn_count

        x_count = cells.count "X"  
        o_count = cells.count "O"
        x_count + o_count
    
    
   end

   def taken?(index_number)
        index = index_number.to_i - 1
             if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
            false
             elsif @cells[index]== "X" || "O"
          true
          
      end
     end

     def valid_move?(index_number)
               
         index = index_number.to_i-1

        if index.between?(0, 8) == true &&  taken?(index_number) == false
            true
        else

            false
            
       end
    end
    
    def input_to_index(input)
        input.to_i-1

    end

    def update(index, player)
        fixed_index = input_to_index(index)
      !taken?(index) ? @cells[fixed_index] = player.token : nil
      
    end
    
end