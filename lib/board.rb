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
       index = index_number.to_i - 1
       if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
       false
     elsif @cells[index]== "X" || "O"
       true
     end
     end

     def valid_move?(index_number)
               
         index = index_number.to_i - 1

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